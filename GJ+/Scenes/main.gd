extends Node2D

var money = 25
var wave = 0
var enemy_left = 0
var wave_mobs = [5, 6, 10, 20, 40, 50, 60, 70, 80, 90, 0]
var wave_speed = [1, 2, 1, 0.5, 0.5, 0.3, 0.3, 0.2, 0.2, 0.2]

var instance
var enemy = preload("res://Scenes/wolf_enemy.tscn")
var tree = preload("res://Scenes/apple_tree.tscn")

var building = false

# Called when the node is ready
func _ready():
	$Wave.start()

	# Ensure no turret is created automatically at the start
	building = false  # Start with building flag as false

# Called when a tower is built
func _tree_build():
	building = false
	money -= 25

# Called every frame (delta not used, so prefix with underscore to avoid warning)
func _process(_delta):
	$CanvasLayer/Label.text = "Money: " + str(money)

# Wave timeout event handler
func _on_wave_timeout():
	enemy_left = wave_mobs[wave]
	$Enemy.wait_time = wave_speed[wave]
	$Enemy.start()

# Enemy timeout event handler
func _on_enemy_timeout():
	instance = enemy.instantiate()
	$Path2D.add_child(instance)
	enemy_left -= 1
	if enemy_left <= 0:
		$Enemy.stop()
		wave += 1
		if wave < len(wave_mobs):
			$Wave.start()
		else:
			get_tree().change_scene("res://Scenes/win.tscn")

# Button press event handler to build a tower
func _on_texture_button_pressed():
	if building == false and money >= 25:
		instance = tree.instantiate()
		add_child(instance)
		_tree_build()  # Call to finalize the tower build
