extends Node

var scenes = ["res://Scenes/Scene 1.tscn", "res://Scenes/Scene 2.tscn"]
var i = 0

func nextScene():
	i += 1
	print("loading next scene...")
	get_tree().change_scene_to_file.call_deferred(scenes[i])

func reloadScene():
	print("restarting scene")
	get_tree().change_scene_to_file("res://Scenes/filler.tscn")
	get_tree().change_scene_to_file(scenes[i])
