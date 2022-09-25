class_name Character
extends KinematicBody2D

export var GRAVITY = 300.0
export var WALK_SPEED = 200
export var JUMP_SPEED = 100.0
var drag = 0.2
var velocity = Vector2()
var selection_index = 1 setget set_selection, get_selection
func _physics_process(delta):
	
	var is_falling = velocity.y > 0.0 and not is_on_floor()
	var is_jumping = Input.is_action_just_pressed("jump") and is_on_floor()
	var is_double_jumping = Input.is_action_just_pressed("jump") and is_falling
	var is_idling = is_on_floor() and is_zero_approx(velocity.x)
	var is_running = is_on_floor() and not is_zero_approx(velocity.x)
	var is_selected = selection_index == Global.selected
	
	if !is_on_floor():
		velocity.y += delta * GRAVITY
	else:
		velocity.y = 1
		
	if is_on_ceiling():
		velocity.y += 100
	
	velocity.x = lerp(velocity.x, 0, drag)
	if is_selected:
		if Input.is_action_pressed("ui_left"):
			velocity.x = -WALK_SPEED
			$AnimatedSprite.flip_h = 1
		elif Input.is_action_pressed("ui_right"):
			velocity.x =  WALK_SPEED
			$AnimatedSprite.flip_h = 0
		else:
			velocity.x = 0
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y -= JUMP_SPEED
			
	move_and_slide(velocity, Vector2(0, -1))
	if Input.is_action_just_pressed("select_1"):
		Global.selected = 1
	elif Input.is_action_just_pressed("select_2"):
		Global.selected = 2
	elif Input.is_action_just_pressed("select_3"):
		Global.selected = 3


func get_selection():
	return selection_index
	
func set_selection(var new_selection) -> void:
	selection_index = new_selection
