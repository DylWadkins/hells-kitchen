extends KinematicBody2D
# Finite State Machine for organizing code whether player is on the floor vs air vs hiding
enum States {AIR =1, FLOOR, HIDE}

# Variables

var state = States.AIR
var velocity = Vector2(0,0)
var lambSauce = 0

# Constant Variables

const SPEED = 130
const GRAVITY = 30
const JUMPFORCE = -750

# code that is run every 60 fps, maybe... correct this is im wrong lol
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
				$Sprite.flip_h = false
			elif Input.is_action_pressed("left"):
				velocity.x = lerp(velocity.x,-SPEED,0.1) if velocity.x > - SPEED  else lerp(velocity.x,SPEED,0.03)
				$Sprite.flip_h = true
			else:
				velocity.x = lerp(velocity.x,0,0.1)
			move_and_fall()
			
# State for when player is on floor
		States.FLOOR:
			if not is_on_floor():
				state = States.AIR
			if Input.is_action_pressed("right"):
				velocity.x = lerp(velocity.x,SPEED,0.1)
				$Sprite.flip_h = false
			elif Input.is_action_pressed("left"):
				velocity.x = lerp(velocity.x, -SPEED, 0.1)
				$Sprite.flip_h = true
			else:
				velocity.x = lerp(velocity.x,0,0.1)
			if Input.is_action_just_pressed("jump"):
				velocity.y = JUMPFORCE
				state = States.AIR
			move_and_fall()
			
			
			
			
			
			
			
			
# Function for moving and falling

func move_and_fall():
	velocity.y = velocity.y + GRAVITY
	velocity = move_and_slide(velocity,Vector2.UP)
	
	
