extends Node2D

var enemies = []
var bullet = preload("res://Scenes/bullet.tscn")  # Preload bullet scene
var current_enemy : Node2D

func _process(_delta):
	if enemies != []:
		current_enemy = enemies[0]

func _on_area_2d_2_area_entered(area):
	if area.is_in_group("Enemy"):
		print("Enemy Entered")
		enemies.append(area)

func _on_area_2d_2_area_exited(area):
	if area.is_in_group("Enemy"):
		print("Enemy Exited")
		enemies.erase(area)

func _on_shoot_timeout():
	print("Can Shoot")
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
