class_name Character
extends KinematicBody2D

export var GRAVITY = 300.0
export var WALK_SPEED = 200
export var JUMP_SPEED = 100.0
var drag = 0.2
var velocity = Vector2()
var selection_index = 1 setget set_selection, get_selection

var is_charging_jump = false
var jumped = false
var charge_start_time = 0
var jump_charge = 0
var anglechargex = 0
var anglechargey = 0
var random_start = 0.0

func _physics_process(delta):	
	var is_selected = selection_index == Global.selected
		
	if !is_on_floor():
		velocity.y += delta * GRAVITY
	else:
		velocity.y = 1
		
	if is_on_ceiling():
		velocity.y += 100
	
	velocity.x = lerp(velocity.x, 0, drag)
	
	if is_selected and !is_charging_jump:
		var is_falling = velocity.y > 0.0 and not is_on_floor()
		var is_double_jumping = Input.is_action_just_pressed("jump") and is_falling
		var is_idling = is_on_floor() and is_zero_approx(velocity.x)
		var is_running = is_on_floor() and not is_zero_approx(velocity.x)

		
		if Input.is_action_just_pressed("jump") and is_on_floor():
			is_charging_jump = true
			charge_start_time = OS.get_ticks_msec()
			print("starting charge")
			print(is_charging_jump)
			var rng = RandomNumberGenerator.new()
			rng.randomize()
			random_start = rng.randf_range(0,3.14)
		if Input.is_action_pressed("ui_left"):
			velocity.x = -WALK_SPEED
			$AnimatedSprite.flip_h = 1
		elif Input.is_action_pressed("ui_right"):
			velocity.x =  WALK_SPEED
			$AnimatedSprite.flip_h = 0
		else:
			pass
			#velocity.x = 0
	if is_charging_jump:
			#print("in thing")
			jump_charge = (1 + sin((OS.get_ticks_msec() - charge_start_time)*.005 - random_start))
			jump_charge = (jump_charge)/(2)
			anglechargex = cos((OS.get_ticks_msec() - charge_start_time) * .008 - random_start)
			anglechargey = -abs(sin((OS.get_ticks_msec() - charge_start_time) * .008 - random_start))
			print(random_start)
			
	if is_charging_jump and Input.is_action_just_released("jump") and is_on_floor():
		velocity.y -= JUMP_SPEED * jump_charge
		velocity += Vector2(anglechargex * 1000, 0)
		is_charging_jump = false
		jump_charge = 0

			
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
