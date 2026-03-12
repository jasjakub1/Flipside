extends CharacterBody2D

const ACCELERATION = 12.0
const DECELERATION = 7.5
const MAX_SPEED = 80.0
const JUMP_VELOCITY = 300.0
const gravity = 1120.0
var SPEED = 0
var footstep_timer = 0.0
const footstep_interval = 0.35  # time between steps
var i = 0
var touchingCeiling = false
@onready var animated_sprite = $AnimatedSprite2D
@onready var game_manager = $"../GameManager"
@onready var ground_check1 = $RayCast2D
@onready var ground_check2 = $RayCast2D2

func _physics_process(delta: float) -> void:
	if ground_check1.is_colliding():
		var collider = ground_check1.get_collider()
		if collider.name == "TileMapLayer2":
			touchingCeiling = true
			
	elif ground_check1.is_colliding():
		var collider = ground_check1.get_collider()
		if collider.name == "TileMapLayer2":
			touchingCeiling = true
	else:
		touchingCeiling = false
			
	# Add the gravity.
	if game_manager.flipped:
		if not touchingCeiling:
			velocity.y -= gravity * delta
			i += 1
	else:
		if not is_on_floor():
			velocity.y += gravity * delta

	# Handle jump.
	if not game_manager.flipped:
		animated_sprite.flip_v = false
		animated_sprite.position = Vector2(0,0)
		if Input.is_action_just_pressed("up") and is_on_floor():
			velocity.y = -1 * JUMP_VELOCITY
	else:
		animated_sprite.flip_v = true
		animated_sprite.position = Vector2(0,5)
		if Input.is_action_just_pressed("up") and touchingCeiling:
			velocity.y = JUMP_VELOCITY
			

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var direction := Input.get_axis("left", "right")
	
	if (not is_on_floor() and not game_manager.flipped):
		animated_sprite.play("jump_mid")
	elif (not touchingCeiling and game_manager.flipped):
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
		if abs(SPEED) < 5.0:
			SPEED = 0
	
	if ((is_on_floor() and not game_manager.flipped) or (touchingCeiling and game_manager.flipped)) and (direction != 0):
		footstep_timer -= delta
		if footstep_timer <= 0:
			$AudioStreamPlayer2D.play()
			footstep_timer = footstep_interval
	else:
		footstep_timer = 0
		$AudioStreamPlayer2D.stop()
	
	if not game_manager.movementDisabled:
		velocity.x = SPEED
	else:
		velocity.x = 0
	
	move_and_slide()
