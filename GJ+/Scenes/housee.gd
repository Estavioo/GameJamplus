extends StaticBody2D

# Counter for the number of enemies that reached the house
var enemy_counter = 0
const MAX_ENEMIES = 3  # Maximum number of enemies allowed to reach the house

# Called when an enemy enters the house's area
func _on_area_2d_area_entered(area):
	print("enemy attack")
	
	if area.is_in_group("Enemy"):  # Check if the area belongs to an enemy
		enemy_counter += 1
		print("Enemy reached the house! Total:", enemy_counter)
		
		if enemy_counter >= MAX_ENEMIES:
			end_game()

# Function to handle the end game scenario
func end_game():
	print("Game Over! Too many enemies reached the house.")
	get_tree().change_scene("res://Scenes/game_over.tscn")  # Load your game over scene

