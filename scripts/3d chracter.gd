extends KinematicBody

export var speed = 10.0
export var jump_impulse = 4.5
export var gravity = 9.8

var velocity = Vector3.ZERO

func _physics_process(delta):
	var input_dir = Vector3.ZERO

	# D-pad / Keyboard Movement Controls
	if Input.is_action_pressed("ui_right"):
		input_dir.x += 1
	if Input.is_action_pressed("ui_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("ui_down"):
		input_dir.z += 1
	if Input.is_action_pressed("ui_up"):
		input_dir.z -= 1

	# Normalize movement input vector to maintain constant speed diagonally
	if input_dir != Vector3.ZERO:
		input_dir = input_dir.normalized()

	# Apply horizontal movement speed
	velocity.x = input_dir.x * speed
	velocity.z = input_dir.z * speed

	# Apply downward gravitational force
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Jump Action (Space / Accept button)
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = jump_impulse

	# Execute 3D physics movement
	velocity = move_and_slide(velocity, Vector3.UP)
