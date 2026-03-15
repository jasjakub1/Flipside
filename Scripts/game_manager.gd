extends Node2D

var flipped = false

var movementDisabled = false

@onready var nonflippedmap = $"../TileMapLayer"
@onready var flippedmap = $"../TileMapLayer2"

@onready var sky_bg = $"../Player/Oip"
@onready var cave_bg = $"../Player/VeryDarkPurpleFreeSolidcolorBackground"

@onready var purpleFX = $"../Player/GPUParticles2D"
@onready var greenFX = $"../Player/GPUParticles2D2"

@onready var playerNode = $"../Player"
@onready var playerBody = $"../Player/PlayerCollisionShape2D"

@onready var floorLayer = $"../TileMapLayer"

func _ready() -> void:
	greenFX.top_level = true
	purpleFX.top_level = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _has_exited_floor() -> bool:
	var space_state = get_world_2d().direct_space_state
	var params = PhysicsShapeQueryParameters2D.new()
	params.set_shape(playerBody.shape)
	params.transform = playerNode.transform
	params.collision_mask = 1 << (1 - 1)  # Only query floor layer
	  
	var results = space_state.intersect_shape(params, 1)
	return results.is_empty()

func _process(_delta: float) -> void:
		
	if Input.is_action_just_pressed("skip"):
		sceneLoader.skipScene()
		
	if Input.is_action_just_pressed("flip") and playerNode.is_on_floor() and not flipped:
		greenFX.position = playerNode.position
		greenFX.emitting = true
		movementDisabled = true
		playerBody.set_deferred("disabled", true)
		playerNode.translate(Vector2.DOWN * 3)
		while not _has_exited_floor():
			playerNode.translate(Vector2.DOWN)
		playerBody.set_deferred("disabled", false)
		flipped = true
		movementDisabled = false
			
	if Input.is_action_just_pressed("flip") and playerNode.touchingCeiling and flipped:
		purpleFX.position = playerNode.position + Vector2.DOWN * 10
		purpleFX.emitting = true
		movementDisabled = true
		playerBody.set_deferred("disabled", true)
		playerNode.translate(Vector2.UP * 3)
		while not _has_exited_floor():
			playerNode.translate(Vector2.UP)
		playerBody.set_deferred("disabled", false)
		flipped = false
		movementDisabled = false
			
	if flipped:
		nonflippedmap.hide()
		sky_bg.hide()
		flippedmap.show()
		cave_bg.show()
	else:
		nonflippedmap.show()
		sky_bg.show()
		flippedmap.hide()
		cave_bg.hide()
		
	pass

func reset_player_state():
	flipped = false
