extends CharacterBody2D

const ACCELERATION = 8.0
const DECELERATION = 5.0
const MAX_SPEED = 50.0
const JUMP_VELOCITY = 275.0

var SPEED = 0
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if not $"../GameManager".flipped:
		if Input.is_action_just_pressed("up") and is_on_floor():
			velocity.y = -1 * JUMP_VELOCITY
	else:
		if Input.is_action_just_pressed("down") and is_on_floor():
			velocity.y = -1 * JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var direction := Input.get_axis("left", "right")
	
	if (not is_on_floor()):
		animated_sprite.play("jump_mid")
	elif direction != 0:
		animated_sprite.play("running")
	else:
		animated_sprite.play("idle")
		
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	if direction:
		SPEED = clamp(SPEED + direction * ACCELERATION, -1 * MAX_SPEED, MAX_SPEED)
	else:
		if SPEED < 0:
			SPEED += DECELERATION
		elif SPEED > 0:
			SPEED -= DECELERATION
	velocity.x = SPEED
	if SPEED == 0:
		print("still")

	move_and_slide()
