extends Area2D
# Accesses the AudioPlaye2D from Gordon to play the Lamb Sound Effect
onready var audioplayer = get_parent().get_node("Chef/Lamb")


func _on_Lamb_Sauce_body_entered(body):
	# Null check to ensure no null pointer errors. (Do these exist in GDScript? IDK)
	if (body.lambSauce != null):
		# Set the lamb sauce variable on the player to true
		body.lambSauce = true
		# Play the sound effect
		$Slurp.play(0)
		# Plays The Lamb Effect From Gordon
		audioplayer.play()
		# Delete the collision
		$Collision.queue_free()
		# Make the sprite invisible
		$Sprite.visible = false
		# Start the timer
		$Timer.start()

# On timeout, delete the lamb sauce object
func _on_Timer_timeout():
	queue_free()
