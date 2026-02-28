extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.name == "PlayerCollisionShape2D":
		sceneLoader.nextScene()
	pass # Replace with function body.
