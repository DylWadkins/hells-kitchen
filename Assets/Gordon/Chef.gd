extends KinematicBody2D

enum States {PATROL =1, CHASE, STUN}

# variables 
var state = States.PATROL
var velocity = Vector2.ZERO
var player = null
export var direction = -1 
var detects_walls = true

# Constant Variables

const  SPEED = 55
const GRAVITY = 30


func _physics_process(delta):
# switch statement for the two states
	match state:
		States.PATROL:
			if player:
				state = States.CHASE
				continue
			print("Patrol")
			velocity.y += 20
			velocity.x = SPEED * direction
			velocity = move_and_slide(velocity,Vector2.UP)
			if is_on_wall():
				$Sprite.scale.x *= sign(direction.x)
				direction = direction * -1
		States.CHASE:
			if !player:
				state = States.PATROL
			print("CHASE")
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



func _on_side_checker_body_entered(body):
	 if body.get_collision_layer() == 1:
		  body.hurt(position.x)
	 $Lamb.play()
	 
