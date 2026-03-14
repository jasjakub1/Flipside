extends Label

func _process(_delta: float) -> void:
	
	if not $"../GameManager".flipped:
		add_theme_color_override("font_color", Color.ORANGE)
	else:
		add_theme_color_override("font_color", Color.WHITE)
