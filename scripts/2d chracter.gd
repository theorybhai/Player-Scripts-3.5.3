extends KinematicBody2D
class_name PlayerCharacter

export (int) var speed = 200
export (int) var jump_speed = -400
export (int) var gravity = 1200

var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity.y += gravity * delta
	var move_direction = 0
	if Input.is_action_pressed("ui_right"):
		move_direction += 1
	if Input.is_action_pressed("ui_left"):
		move_direction -= 1

	velocity.x = move_direction * speed

	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = jump_speed

	velocity = move_and_slide(velocity, Vector2.UP)
