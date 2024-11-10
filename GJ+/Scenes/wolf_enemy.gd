extends PathFollow2D

var health = 3
var speed = 50

func _physics_process(delta):
	progress += speed*delta
	if progress >= 10000:
		queue_free()


func _on_area_2d_area_entered(area):
	if area.is_in_group("Bullet"):
		area.queue_free()
		health -=1
		if health <=0:
			get_parent().get_parent().money+=10
			queue_free()
