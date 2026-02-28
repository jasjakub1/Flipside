extends CharacterBody2D

const ACCELERATION = 8.0
const DECELERATION = 5.0
const MAX_SPEED = 50.0
const JUMP_VELOCITY = 250.0

var SPEED = 0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = -1 * JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		SPEED = clamp(SPEED + direction * ACCELERATION, -1 * MAX_SPEED, MAX_SPEED)
	else:
		if SPEED < 0:
			SPEED += DECELERATION
		elif SPEED > 0:
			SPEED -= DECELERATION
	velocity.x = SPEED

	move_and_slide()
