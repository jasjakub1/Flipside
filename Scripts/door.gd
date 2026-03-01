extends Node2D
	
	
	
func _on_area_2d_body_entered(body) -> void:
	if body.name == "Player":
		sceneLoader.nextScene()
	pass # Replace with function body.
