extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("player entered door")
	sceneLoader.nextScene()
	pass # Replace with function body.
