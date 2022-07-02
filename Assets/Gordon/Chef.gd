extends KinematicBody2D

var velocity = Vector2(0, 0)

export var speed = 32
export var gravity = 30
# May want to use position 2Ds in the future
# This garbage code is just for testing
export var target_position = 50 
var player = null

func _ready():
	pass

func _process(delta):
	move_character()
	
func move_character():
	if ($".".position.x < target_position - 1):
		velocity.x = speed * 1
		$Sprite.flip_h = false
	elif ($".".position.x > target_position + 1):
		velocity.x = speed * -1
		$Sprite.flip_h = true
	else:
		velocity.x = 0

	velocity.y = gravity

	velocity = move_and_slide(velocity, Vector2.UP)



