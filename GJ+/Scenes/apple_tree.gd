extends Node2D

@onready var Apple=$Sprite2D

var enemies = []
var bullet=preload("res://Scenes/bullet.tscn")
var current_enemy

func _pyshics_process(_delta):
	if enemies != []:
		current_enemy=enemies[0]
		Apple.look_at(current_enemy.global_position)

func _on_area_2d_2_area_entered(area):
	print("Enter")
	if area.is_in_group("Enemy"):
		enemies.append(area)

func _on_area_2d_2_area_exited(area):
	print("exit")
	if area.is_in_group("Enemy"):
		enemies.erase(area)

func _on_shoot_timeout():
	if current_enemy:
		if enemies:
			if current_enemy == enemies[0]:
				var b = bullet.instantiate()
				b.global_position = global_position
				b.target = current_enemy
				get_parent().add_child(b)
