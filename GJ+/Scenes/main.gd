extends Node2D

var money = 25
var wave = 0
var enemy_left = 0
var wave_mobs = [ 5, 6, 10, 20, 40, 0]
var wave_speed = [1,1,0.5,0.5,0.3,100]

var instance
var enemy = preload("res://Scenes/wolf_enemy.tscn")

func _ready():
	$Wave.start()

func _on_wave_timeout():
	enemy_left = wave_mobs[wave]
	$Enemy.wait_time=wave_speed[wave]
	$Enemy.start()

func _on_enemy_timeout():
	instance=enemy.instantiate()
	$Path2D.add_child(instance)
	enemy_left -= 1
	if enemy_left <= 0:
		$Enemy.stop()
		wave+=1
		if wave<len(wave_mobs):
			$Wave.start()
		
	
	
	
	
	
