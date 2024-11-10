extends ProgressBar

@onready var time = $Timer
@onready var damage_bar = $"DAMAGE BAR"


var health = 0 : set = _set_health

func _set_health(new_health):
	var previous_health = health
	health = min(max_value, new_health)
	value = health
	
	if health < 0:
		queue_free()
		
	if health < previous_health:
		time.start()
		
	else:
		damage_bar.value = health

func init_health(_health):
	health = health
	max_value = health
	value = health
	damage_bar.max_value = health
	damage_bar.value = health

func _on_timer_timeout():
	damage_bar.value = health
