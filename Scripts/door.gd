extends Node2D

var locked = false

func _on_area_2d_body_entered(body) -> void:
	if body.name == "Player" and not locked:
		sceneLoader.nextScene()
	pass # Replace with function body.
