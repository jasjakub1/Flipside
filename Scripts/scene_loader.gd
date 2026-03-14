extends Node

var scenes = ["res://Scenes/Scene 1.tscn", "res://Scenes/Scene 3.tscn", "res://Scenes/Scene 6.tscn", "res://Scenes/Scene 2.tscn", "res://Scenes/Scene 5.tscn", "res://Scenes/Scene 7.tscn", "res://Scenes/Scene 8.tscn", "res://Scenes/Scene 9.tscn", "res://Scenes/Victory.tscn"]
var i = 0

func nextScene():
	i += 1
	print("loading next scene...")
	get_tree().change_scene_to_file.call_deferred(scenes[i])

func reloadScene():
	
	print("restarting scene")
	get_tree().change_scene_to_file.call_deferred("res://Scenes/filler.tscn")
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file(scenes[i])
	
func loadSceneNum(sceneNum : int):
	i = sceneNum
	print("loading scene {sceneNum}")
	get_tree().change_scene_to_file.call_deferred(scenes[sceneNum])
	
func loadSceneFile(sceneFilePath : String):
	print("loading scene...")
	get_tree().change_scene_to_file.call_deferred(sceneFilePath)
