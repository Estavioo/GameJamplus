extends Node2D




func _on_replay_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_replay_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
