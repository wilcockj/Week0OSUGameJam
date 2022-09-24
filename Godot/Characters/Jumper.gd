extends "res://Characters/CharacterController.gd"

var idx = 1
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
	$Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
