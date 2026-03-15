extends Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Level: " + str(sceneLoader.i + 1)
