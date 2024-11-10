extends Node2D

var enemies = []
var bullet = preload("res://Scenes/bullet.tscn")  # Preload bullet scene
var current_enemy : Node2D
var building = true  # Controls whether the player is currently building a turret
var canplace = false  # Determines if turret placement is allowed based on platform area

# Called every physics frame
func _physics_process(_delta):
	if building == false:
		if enemies != []:
			current_enemy = enemies[0]
	else:
		global_position = get_global_mouse_position()
		if canplace == true:  # Only allow placement if canplace is true
			if Input.is_action_just_pressed("click"):
				building = false
				handle_tower_built()

# Function to handle the tower building
func handle_tower_built():
	print("Tower has been built!")
	# Additional logic to handle what happens when the tower is built
	# For example, instantiate the tower or deduct money

# Called when an enemy enters the area
func _on_area_2d_2_area_entered(area):
	if area.is_in_group("Enemy"):
		if building == false:
			enemies.append(area)

# Called when an enemy exits the area
func _on_area_2d_2_area_exited(area):
	if area.is_in_group("Enemy"):
		if building == false:
			enemies.erase(area)

# Called on shoot timeout to handle shooting logic
func _on_shoot_timeout():
	print("Can Shoot")
	if building == false:
		if current_enemy:
			print("Enemy Inside")
			if enemies:
				print("Enemy Inside!!!")
				if current_enemy == enemies[0]:
					print("Shoot Apple")
					var b = bullet.instantiate()
					b.global_position = global_position
					b.target = current_enemy
					get_parent().add_child(b)

# Called when entering the "Platform" area to enable placement
func _on_area_2d_area_entered(area):
	if area.is_in_group("Platform"):
		if building == true:
			canplace = true  # Corrected to assignment

# Called when exiting the "Platform" area to disable placement
func _on_area_2d_area_exited(area):
	if area.is_in_group("Platform"):
		if building == true:
			canplace = false  # Corrected to assignment
