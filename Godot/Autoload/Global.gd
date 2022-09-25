extends Node

var selected = 1
var tilemap_rect 
var map_cellsize = 0
var can_be_selected = [1,2]
var current_level = 0

func go_next_stage():
	print(current_level)
	current_level += 1
	get_tree().change_scene("res://Level"+str(current_level)+".tscn")
