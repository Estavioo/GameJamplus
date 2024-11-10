extends PathFollow2D

var health = 5
var speed = 100

func _physics_process(delta):
	progress += speed*delta
	if progress >= 10000:
		queue_free()
