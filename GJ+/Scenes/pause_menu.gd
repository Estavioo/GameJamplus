extends Control

func _ready():
	# Hide the pause menu initially
	visible = false
	get_tree().paused = false
	print("Game started unpaused.")

func resume():
	get_tree().paused = false
	visible = false  # Hide the pause menu when resuming
	$AnimationPlayer.play_backwards("Blur")
	print("Game resumed.")

func pause():
	get_tree().paused = true
	visible = true  # Show the pause menu when pausing
	$AnimationPlayer.play("Blur")
	print("Game paused.")

func estesc():
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			resume()
		else:
			pause()

func _on_button_pressed():
	resume()

func _on_button_2_pressed():
	resume()
	get_tree().reload_current_scene()

func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func _process(_delta):
	estesc()
