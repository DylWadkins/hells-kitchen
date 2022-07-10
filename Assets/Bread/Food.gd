extends Area2D

# Plays from 0.4s mark. Set to invisible to simulate picking up.
func _on_Area2D_body_entered(body):
	$Crunch.play(0.4)
	$Collision.queue_free()
	$Sprite.visible = false

func _on_Crunch_finished():
	queue_free()
	
