extends Node2D

var flipped = false

@onready var nonflippedmap = $"../TileMapLayer"
@onready var flippedmap = $"../TileMapLayer2"

@onready var playerBody = $"../Player"
@onready var flipPos = $"../Player/FlipPos"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not flipped:
		if Input.is_action_just_pressed("down") and playerBody.is_on_floor():
			flipped = true
			var collision = playerBody.move_and_collide(Vector2.UP, 4 * delta)
			while collision == null:
				collision = playerBody.move_and_collide(Vector2.UP, 4 * delta)
			
	else:
		if Input.is_action_just_pressed("up")and playerBody.is_on_ceiling():
			flipped = false
			
	if flipped:
		nonflippedmap.hide()
		flippedmap.show()
	else:
		nonflippedmap.show()
		flippedmap.hide()
		
	pass
