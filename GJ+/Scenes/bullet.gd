extends Area2D

var target : Node2D
var speed = 500 
var direction = Vector2.ZERO

func _ready():
	if target:
		direction = (target.global_position - global_position).normalized()

func _physics_process(delta):
	global_position += direction * speed * delta
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	if not get_viewport_rect().has_point(global_position):
		queue_free()
