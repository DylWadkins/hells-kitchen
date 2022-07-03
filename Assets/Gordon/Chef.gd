extends KinematicBody2D

var velocity = Vector2(0, 0)

export var speed = 32
export var gravity = 30
# This garbage code is just for testing
export var target_position = 200
onready var animationPlayer = $AnimationPlayer

func _ready():
	pass

func _process(delta):
	move_character()
	
func move_character():
	if ($".".position.x < target_position - 1):
		velocity.x = speed * 1
		animationPlayer.play("Walk Right")
	elif ($".".position.x > target_position + 1):
		velocity.x = speed * -1
		animationPlayer.play("Walk Left")
	else:
		velocity.x = 0
		animationPlayer.play("Idle Right")

	velocity.y = gravity

	velocity = move_and_slide(velocity, Vector2.UP)



