extends Node

var selected = 1
var tilemap_rect 
var map_cellsize = 0
var can_be_selected = [1,2]
var current_level = 0
var end_loc

func go_next_stage():
	current_level += 1
	get_tree().change_scene("res://Level"+str(current_level)+".tscn")

func _process(delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
		for member in get_tree().get_nodes_in_group("stones"):
			member.queue_free()
		can_be_selected = [1,2]
	if Input.is_action_just_pressed("exit"):
		if OS.has_feature('JavaScript'):
			JavaScript.eval("window.close()")	
		else:	
			get_tree().quit()
