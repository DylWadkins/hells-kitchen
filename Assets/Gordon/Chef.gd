extends KinematicBody2D

enum States {PATROL =1, CHASE, STUN}

# variables 
var state = States.PATROL
var velocity = Vector2.ZERO
var player = null
export var direction = -1 

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
				direction = direction * -1
				$Sprite.flip_h = not $Sprite.flip_h
			if direction == -1:
				$AnimationPlayer.play("Walk Left")
			if direction == 1:
				$AnimationPlayer.play("Walk Right")
		States.CHASE:
			if !player:
				state = States.PATROL
			print("CHASE")
			velocity = Vector2.ZERO
			if player:
					velocity = position.direction_to(player.position) * SPEED
					velocity = move_and_slide(velocity)


func _on_EyeSight_body_entered(body):
	  player = body
	  $Donkey.play()
	  


func _on_EyeSight_body_exited(body):
	 player = null



func _on_side_checker_body_entered(body):
	 if body.get_collision_layer() == 1:
		  $Timer.start()
	 


func _on_Timer_timeout():
	$Lamb.play()
	player.set_collision_layer_bit(0,false)
	player.hurt(position.x)
