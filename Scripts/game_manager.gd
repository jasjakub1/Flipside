extends Node2D

var flipped = false

var falling = false

@onready var nonflippedmap = $"../TileMapLayer"
@onready var flippedmap = $"../TileMapLayer2"

@onready var sky_bg = $"../Player/Oip"
@onready var cave_bg = $"../Player/VeryDarkPurpleFreeSolidcolorBackground"

@onready var playerNode = $"../Player"
@onready var playerBody = $"../Player/PlayerCollisionShape2D"

@onready var floorLayer = $"../TileMapLayer"


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
	if not flipped:
		if Input.is_action_just_pressed("flip") and playerNode.is_on_floor():
			playerBody.set_deferred("disabled", true)
			await get_tree().create_timer(0.1).timeout
			while not _has_exited_floor():
				playerNode.translate(Vector2.DOWN)
			playerBody.set_deferred("disabled", false)
			flipped = true
			
	else:
		if Input.is_action_just_pressed("flip") and playerNode.is_on_ceiling():
			playerBody.set_deferred("disabled", true)
			await get_tree().create_timer(0.1).timeout
			while not _has_exited_floor():
				playerNode.translate(Vector2.UP)
			playerBody.set_deferred("disabled", false)
			flipped = false
			
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
