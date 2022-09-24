extends "res://Characters/CharacterController.gd"

var idx = 1
func _ready():
	set_selection(idx)

func _process(delta):
	if Global.selected == idx:
		$Camera2D.current = true
	else:
		$Camera2D.current = false
