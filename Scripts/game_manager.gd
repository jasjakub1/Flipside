extends Node2D

var flipped = false

@onready var nonflippedmap = $"../TileMapLayer"
@onready var flippedmap = $"../TileMapLayer2"

@onready var sky_bg = $"../Player/Oip"
@onready var cave_bg = $"../Player/VeryDarkPurpleFreeSolidcolorBackground"

@onready var playerBody = $"../Player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not flipped:
		if Input.is_action_just_pressed("ui_accept") and playerBody.is_on_floor():
			flipped = true
			
	else:
		if Input.is_action_just_pressed("ui_accept") and playerBody.is_on_floor():
			flipped = false
			
	if flipped:
		nonflippedmap.hide()
		sky_bg.hide()
		flippedmap.show()
		cave_bg.show()
	else:
		nonflippedmap.show()
		sky_bg.show()
		flippedmap.hide()
		cave_bg.hide()
		
	pass
