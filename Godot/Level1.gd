extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.tilemap_width = $TileMap.get_used_rect().size.x
	Global.tilemap_height = $TileMap.get_used_rect().size.y
	Global.map_cellsize = $TileMap.cell_size


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
