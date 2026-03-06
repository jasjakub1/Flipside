extends Button

@onready var levelSelectButton = $"../../Levels button/Button"
var level = 1
func _ready() -> void:
	level = get_index()
	$Label.text = str(level + 1)
	visible = false

func _pressed() -> void:
	sceneLoader.loadSceneNum(level)

func _process(_delta: float) -> void:
	if levelSelectButton.ButtonToggled:
		visible = true
	elif not levelSelectButton.ButtonToggled:
		visible = false
