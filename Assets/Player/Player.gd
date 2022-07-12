extends KinematicBody2D
# Finite State Machine for organizing code whether player is on the floor vs air vs hiding
enum States {AIR =1, FLOOR}

# Variables
var state = States.FLOOR
var velocity = Vector2(0,0)
var lambSauce = 0
onready var state_machine = $AnimationTree.get("parameters/playback")
onready var sprite = $Sprite

# Constant Variables

const SPEED = 90
const GRAVITY = 30
const JUMPFORCE = -500
const FRICTION = 0.5

# code that is run every frame
func _physics_process(delta):
# switch statement for the two states
	match state:
		States.AIR:
			if is_on_floor():
				state = States.FLOOR
				continue
			if Input.is_action_pressed("right"):
				velocity.x = lerp(velocity.x,SPEED,0.1) if velocity.x < SPEED  else lerp(velocity.x,SPEED,0.03)
				sprite.flip_h = false
			elif Input.is_action_pressed("left"):
				velocity.x = lerp(velocity.x,-SPEED,0.1) if velocity.x > - SPEED  else lerp(velocity.x,SPEED,0.03)
				sprite.flip_h = true
			else:
				velocity.x = lerp(velocity.x,0,FRICTION)

				
			move_and_fall()
			
# State for when player is on floor
		States.FLOOR:
			if not is_on_floor():
				state = States.AIR
			if Input.is_action_pressed("right"):
				velocity.x = lerp(velocity.x,SPEED,0.1)
				sprite.flip_h = false
				state_machine.travel("Run")
			elif Input.is_action_pressed("left"):
				velocity.x = lerp(velocity.x, -SPEED, 0.1)
				sprite.flip_h = true
				state_machine.travel("Run")
			else:
				velocity.x = lerp(velocity.x,0,FRICTION)
				state_machine.travel("Idle")
			if Input.is_action_just_pressed("jump"):
				velocity.y = JUMPFORCE
				state = States.AIR
			move_and_fall()
			
			
# Function for moving and falling

func move_and_fall():
	velocity.y = velocity.y + GRAVITY
	velocity = move_and_slide(velocity,Vector2.UP)
	
	
	
func hurt(var enemyposx):
	set_modulate(Color(1,0.3,0.3,0.4))
	velocity.y = JUMPFORCE * 0.3
	
	if position.x < enemyposx:
		velocity.x = -800
	elif position.x > enemyposx:
		velocity.x = 800
		
	Input.action_release("left")
	Input.action_release("right")
	$Timer.start()
	
	


func _on_Timer_timeout():
	get_tree().change_scene("res://Assets/Game Over Screen/Game Over.tscn")
