extends Node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("return"):
		sceneLoader.loadSceneFile("res://Scenes/Main Menu.tscn")
	pass
