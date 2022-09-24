extends Character

var idx = 2
func _ready():
	set_selection(idx)

func _process(delta):
	if Global.selected == idx:
		$Camera2D.current = true
	else:
		$Camera2D.current = false
	var map_limits = Global.tilemap_rect
	var map_cellsize = Global.map_cellsize
	$Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
