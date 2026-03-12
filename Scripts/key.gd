extends Node2D

@onready var door = $"../Door"
func _ready() -> void:
	door.locked = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" and door.locked:
		door.locked = false
