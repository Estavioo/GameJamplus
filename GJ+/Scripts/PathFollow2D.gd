extends PathFollow2D

@export var speed: float = 0.1
var previous_position: Vector2
var animated_sprite: AnimatedSprite2D

func _ready():
	previous_position = position
	animated_sprite = $WolfEnemy/AnimatedSprite2D

func _process(delta):
	progress_ratio += delta * speed
	
	# Calculate the direction by finding the difference between the current and previous positions
	var direction = position - previous_position
	
	# Set animation based on direction
	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			animated_sprite.play("Right")
		else:
			animated_sprite.play("Left")
	else:
		if direction.y > 0:
			animated_sprite.play("Down")
		else:
			animated_sprite.play("Up")
	
	# Update the previous position for the next frame
	previous_position = position
