extends KinematicBody2D
class_name Player

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (float) var move_scale = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	var final_direction := Vector2.ZERO
	var directions := {
		"move_down": Vector2.DOWN,
		"move_left": Vector2.LEFT,
		"move_right": Vector2.RIGHT,
		"move_up": Vector2.UP,
	}
	for direction in directions:
		if Input.is_action_pressed(direction):
			final_direction = final_direction + directions[direction]
	final_direction = final_direction.normalized() * move_scale

	move_and_slide(final_direction)
