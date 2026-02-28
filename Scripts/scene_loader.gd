extends Node

var scenes = ["res://Scenes/Scene 1.tscn", "res://Scenes/Scene 2.tscn"]
var i = 0

func nextScene():
	i += 1
	get_tree().change_scene_to_file.call_deferred(scenes[i])
