extends Character

var idx = 2
func _ready():
	set_selection(idx)

func _process(delta):
	if Global.selected == idx:
		$Camera2D.current = true
		$Light2D.energy = 1
	else:
		$Camera2D.current = false
		$Light2D.energy = 0
	var map_limits = Global.tilemap_rect
	var map_cellsize = Global.map_cellsize
	if map_limits and map_cellsize:
		$Camera2D.limit_left = map_limits.position.x * map_cellsize.x
		$Camera2D.limit_right = map_limits.end.x * map_cellsize.x
		$Camera2D.limit_top = map_limits.position.y * map_cellsize.y
		$Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	$Line2D.clear_points()
	$Line2D.add_point($AnimatedSprite.position + Vector2(20,20))
	$Line2D.add_point($AnimatedSprite.position + Vector2(20, 20 -jump_charge * 50))
	
	$AngleLine.clear_points()
	$AngleLine.add_point($AnimatedSprite.position)
	$AngleLine.add_point($AnimatedSprite.position + Vector2(anglechargex * 20, anglechargey*20))
