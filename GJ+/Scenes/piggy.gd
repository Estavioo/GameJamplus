extends Node2D


var is_playing_placement = false

func _process(delta):
	if Input.action_pressed("click") and not is_playing_placement:
		$backtoidle.start()
		$AnimatedSprite2D.play("Placement")
		is_playing_placement = true
	
func _on_backtoidle_timeout():
	$AnimatedSprite2D.play("idle")
	
