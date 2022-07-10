extends Area2D


var Player_body

# Plays from 0.4s mark. Set to invisible to simulate picking up.
func _on_Area2D_body_entered(body):
	Player_body = body
	body.set_collision_layer_bit(0, false)
	$Crunch.play(0.4)
	$Collision.queue_free()
	$Sprite.visible = false
	$Timer.start()
	print("not hurt")



func _on_Timer_timeout():
	Player_body.set_collision_layer_bit(0, true)
	print("hurt")
	queue_free()
