extends KinematicBody2D

enum States {PATROL =1, CHASE, STUN}

# variables 
var state = States.CHASE
var velocity = Vector2.ZERO
var player = null
export var direction = -1 


# Constant Variables

const  SPEED = 75
const GRAVITY = 30


func _physics_process(delta):
# switch statement for the two states
	match state:
		States.CHASE:
			velocity = Vector2.ZERO
			if player:
					velocity = position.direction_to(player.position) * SPEED
					velocity = move_and_slide(velocity)
		#  States.PATROL:
			

func _on_EyeSight_body_entered(body):
	  player = body
	  $Donkey.play()


func _on_EyeSight_body_exited(body):
	 player = null
