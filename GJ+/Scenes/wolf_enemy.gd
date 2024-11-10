extends CharacterBody2D

# Reference to the AnimatedSprite2D node
@onready var animated_sprite = $AnimatedSprite2D

# Variables to track previous and current positions
var previous_position: Vector2
var direction: Vector2

# Called when the node enters the scene
func _ready():
	previous_position = position  # Set the initial previous position

# Called every frame
func _process(delta):
	# Calculate movement direction
	direction = position - previous_position
	previous_position = position  # Update previous position

	# Choose animation based on movement direction
	if direction.length() > 0:
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
