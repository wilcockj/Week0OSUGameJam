extends Node

var selected = 1
var tilemap_rect 
var map_cellsize = 0
var can_be_selected = [1,2,3]
var current_level = 1

func go_next_stage():
	current_level += 1
	get_tree().change_scene("res://Scenes/Levels/Level"+str(current_level)+".tscn")
