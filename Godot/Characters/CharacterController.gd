class_name Character
extends KinematicBody2D

export var GRAVITY = 300.0
export var WALK_SPEED = 200
export var JUMP_SPEED = 100.0
var drag = 0.2

var velocity = Vector2()
var selection_index = 1 setget set_selection, get_selection
func _physics_process(delta):
	if !is_on_floor():
		velocity.y += delta * GRAVITY
	else:
		velocity.y = 0
	
	velocity.x = lerp(velocity.x, 0, drag)
	
	if selection_index == Global.selected:
		if Input.is_action_pressed("ui_left"):
			velocity.x = -WALK_SPEED
		elif Input.is_action_pressed("ui_right"):
			velocity.x =  WALK_SPEED
		else:
			velocity.x = 0
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y -= JUMP_SPEED
		# We don't need to multiply velocity by delta because "move_and_slide" already takes delta time into account.
	
		# The second parameter of "move_and_slide" is the normal pointing up.
		# In the case of a 2D platformer, in Godot, upward is negative y, which translates to -1 as a normal.
	move_and_slide(velocity, Vector2(0, -1))
	if Input.is_action_just_pressed("select_1"):
		Global.selected = 1
	elif Input.is_action_just_pressed("select_2"):
		Global.selected = 2
	elif Input.is_action_just_pressed("select_3"):
		Global.selected = 3
	elif Input.is_action_just_pressed("select_4"):
		Global.selected = 4
	elif Input.is_action_just_pressed("select_5"):
		Global.selected = 5
	elif Input.is_action_just_pressed("select_6"):
		Global.selected = 6

func get_selection():
	return selection_index
func set_selection(var new_selection) -> void:
	selection_index = new_selection
