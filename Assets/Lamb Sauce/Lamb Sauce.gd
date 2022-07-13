extends Area2D

func _on_Lamb_Sauce_body_entered(body):
	# Null check to ensure no null pointer errors. (Do these exist in GDScript? IDK)
	if (body.lambSauce != null):
		# Set the lamb sauce variable on the player to true
		body.lambSauce = true
		# Play the sound effect
		$Slurp.play(0)
		# Delete the collision
		$Collision.queue_free()
		# Make the sprite invisible
		$Sprite.visible = false
		# Start the timer
		$Timer.start()

# On timeout, delete the lamb sauce object
func _on_Timer_timeout():
	queue_free()
