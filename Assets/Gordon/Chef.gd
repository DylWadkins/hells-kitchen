extends KinematicBody2D

enum States {PATROL =1, CHASE, STUN}

# variables 
var state = States.PATROL
var velocity = Vector2.ZERO
var player = null
export var direction = -1 
var last_direction = null



# Constant Variables

const SPEED = 55
const GRAVITY = 30
const VIOLIN_CHANCE = 0.35


func _physics_process(delta):
# switch statement for the two states
	match state:
		States.PATROL:
			if player:
				state = States.CHASE
				continue
			#print("Patrol")
			$AnimationPlayer.play("Walk")
			velocity.y += 20
			velocity.x = SPEED * direction
			velocity = move_and_slide(velocity,Vector2.UP)
			if is_on_wall():
				direction = direction * -1
				$Sprite.flip_h = not $Sprite.flip_h
		States.CHASE:
			if !player:
				state = States.PATROL
				continue
			#print("CHASE")
			$AnimationPlayer.play("Walk")
			velocity = Vector2.ZERO
			if player:
					velocity.x = position.direction_to(player.position).x * SPEED 
					velocity = move_and_slide(velocity)
			if player.position.x < get_position().x:
				direction = position.direction_to(player.position).x
				$Sprite.flip_h = true
			elif player.position.x > get_position().x:
				direction = position.direction_to(player.position).x
				$Sprite.flip_h = false
			last_direction = direction



func _on_EyeSight_body_entered(body):
	  player = body
	  $Donkey.play()
	  


func _on_EyeSight_body_exited(body):
	 player = null
	 print(last_direction)



func _on_side_checker_body_entered(body):
	 if body.get_collision_layer() == 1:
		  $Kill.start()
	 

func _on_Timer_timeout():
	$Lamb.play()
	player.set_collision_layer_bit(0,false)
	player.hurt(position.x)


func _on_VisibilityNotifier2D_screen_entered():
	# percent chance to play violin sting
	if randf() < VIOLIN_CHANCE:
		$Violin.play()
		
