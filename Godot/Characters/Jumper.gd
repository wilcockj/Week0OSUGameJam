extends "res://Characters/CharacterController.gd"

var lavaplatform = preload("res://LavaGuyDead.tscn")
var idx = 1
func _ready():
	set_selection(idx)

func _process(delta):
	if Global.selected == idx:
		$Camera2D.current = true
		$Light2D.energy = 1
		if get_parent().name == "Level0":
			$ControlHUD.visible = true
		else:
			$ControlHUD.visible = false
	else:
		$Camera2D.current = false
		$Light2D.energy = 0
		$ControlHUD.visible = false
	var map_limits = Global.tilemap_rect
	var map_cellsize = Global.map_cellsize
	if map_limits and map_cellsize:
		$Camera2D.limit_left = map_limits.position.x * map_cellsize.x
		$Camera2D.limit_right = map_limits.end.x * map_cellsize.x
		$Camera2D.limit_top = map_limits.position.y * map_cellsize.y
		$Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	#var barthing = Vector2(position.x,position.y + (jump_charge*50))
	$Line2D.clear_points()
	$Line2D.add_point($AnimatedSprite.position + Vector2(20,20))
	$Line2D.add_point($AnimatedSprite.position + Vector2(20, 20 -jump_charge * 25))
	$ChargingBorder.clear_points()
	$ChargingBorder.add_point($AnimatedSprite.position + Vector2(20,20))
	$ChargingBorder.add_point($AnimatedSprite.position + Vector2(20, 20 -jump_charge * 25))
	
	$AngleLine.clear_points()
	$AngleLine.add_point($AnimatedSprite.position)
	$AngleLine.add_point($AnimatedSprite.position + Vector2(anglechargex * 20, anglechargey*20))
	
	$AngleLineBorder.clear_points()
	$AngleLineBorder.add_point($AnimatedSprite.position)
	$AngleLineBorder.add_point($AnimatedSprite.position + Vector2(anglechargex * 20, anglechargey*20))

func on_hit_water(body):
	if body.name == "LavaMan":
		var l = lavaplatform.instance()
		l.position = global_position
		l.add_to_group("stones")
		get_tree().get_root().add_child(l)
		Global.can_be_selected.erase(idx)
		
		var timer = Timer.new()
		visible = false
		$Trail2D.visible = false
		timer.connect("timeout",self,"_on_timer_timeout") 
		#timeout is what says in docs, in signals
		#self is who respond to the callback
		#_on_timer_timeout is the callback, can have any name
		add_child(timer) #to process
		timer.start() #to start
	

func _on_timer_timeout():
	Global.selected = 2
	queue_free()
	
