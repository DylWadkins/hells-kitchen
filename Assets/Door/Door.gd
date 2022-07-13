extends Area2D
# Create a variable to store whether the player has already entered the door once, used to prevent duplicate noise playing
var entered = false
# Exposes a string variable to select the next level
export var NextScene : String
func _ready():
	# Sets the door open sprite invisible
	$Open.visible = false
	# Chef = get_node("Chef")
func _on_Area2D_body_entered(body):
	# Check if the body entering has a lamb sauce variable (Prevents crashes if Chef enters or other objects)
	if(body.lambSauce != null):
		# Checks if the player's lamb sauce variable is true
		if(body.lambSauce):
			# Change the sprite to the open variant (this can probably be done with an animated sprite and changing the frame)
			$Closed.visible = false
			$Open.visible = true
			# Checks to see if the player has previously entered to stop sound spam
			if(!entered):
				# Play the sound
				$Sting.play(0.25)
			# Sets the entered variable to true
			entered = true
			# Start the timer
			$Timer.start()
		
		# Chef.queue_free()
		


func _on_Timer_timeout():
	# Change to the next level
	get_tree().change_scene(NextScene)
