extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _on_Lamb_Sauce_body_entered(body):
	print("Entered lamb sauce")
	if (body.lambSauce != null):
		print("Changing lamb sauce variable on player")
		body.lambSauce = true
		$Slurp.play(0.4)
		$Collision.queue_free()
		$Sprite.visible = false
		$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	queue_free()
