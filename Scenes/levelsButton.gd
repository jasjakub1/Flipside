extends Button

var ButtonToggled = false
@onready var splashScreen = $"../../PlatformSplashScreen"
@onready var sunPNG = $"../../Sun2"

func _pressed() -> void:
	if ButtonToggled:
		ButtonToggled = false
		splashScreen.visible = true
		sunPNG.visible = true
	else:
		ButtonToggled = true
		splashScreen.visible = false
		sunPNG.visible = false
