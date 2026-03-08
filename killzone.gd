extends Area2D

@export var respawn_position: Vector2
@onready var game_manager = $"../game_manager"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(game_manager)
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.global_position = Vector2(0,0)
		body.velocity = Vector2.ZERO
		print("Player died")
		sceneLoader.reloadScene()
	pass # Replace with function body.
