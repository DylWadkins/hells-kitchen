extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _on_Area2D_body_entered(body):
	print("Entered lamb sauce")
	if (body.lambSauce != null):
		print("Changing lamb sauce variable on player")
		body.lambSauce = true
		$Slurp.play(0.4)
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
