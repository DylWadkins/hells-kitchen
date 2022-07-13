extends Area2D
# Variable to store the player for the timer
var Player_body

# Plays from 0.4s mark. Set to invisible to simulate picking up.
func _on_Area2D_body_entered(body):
	# Store the player's body
	Player_body = body
	# Change the collision bit to false for the Chef layer
	body.set_collision_layer_bit(0, false)
	# Play the crunch noise
	$Crunch.play(0.4)
	# Delete the collision
	$Collision.queue_free()
	# Set the sprite to invisible
	$Sprite.visible = false
	# Start the timer
	$Timer.start()



func _on_Timer_timeout():
	# Re-enable the collision bit for the Chef layer
	Player_body.set_collision_layer_bit(0, true)
	# Delete the food object
	queue_free()
