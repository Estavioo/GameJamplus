extends PathFollow2D

var speed = 0.035
var previous_position: Vector2
@onready var animated_sprite: AnimatedSprite2D = $Area2D/AnimatedSprite2D  # Reference to AnimatedSprite2D
var health = 3  # Starting health
var money = 0  # Assuming you want to track money

func _ready():
	# Verify that the AnimatedSprite2D is valid
	if animated_sprite == null:
		print("Error: Cannot find 'AnimatedSprite2D'. Check node path.")
		return
	
	previous_position = position

func _process(delta):
	# Update the progress of the PathFollow2D
	progress_ratio += delta * speed
	
	# Calculate the direction of movement by finding the difference between the current and previous positions
	var direction = position - previous_position
	
	# Set animation based on direction without rotating the sprite
	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			# Moving right
			animated_sprite.rotation_degrees = -180
			animated_sprite.flip_h = true
			animated_sprite.flip_v = true
			animated_sprite.play("Right")
		else:
			# Moving left
			animated_sprite.rotation_degrees = -180
			animated_sprite.play("Left")
	else:
		if direction.y > 0:
			# Moving down
			animated_sprite.rotation_degrees = -90
			animated_sprite.play("Down")
		else:
			# Moving up
			animated_sprite.rotation_degrees = -270
			animated_sprite.play("Up")

	# Update the previous position for the next frame
	previous_position = position

	# Check if the enemy has reached the end of the path (game over condition)
	if progress >= 10000:
		queue_free()

func _on_area_2d_area_entered(area):
	# Detect collision with a bullet and reduce health
	if area.is_in_group("Bullet"):
		area.queue_free()  # Destroy the bullet
		health -= 1  # Decrease health when hit by a bullet
		
		if health <= 0:
			# Increase money for killing the enemy and remove the enemy from the scene
			get_parent().get_parent().money += 5
			queue_free()
