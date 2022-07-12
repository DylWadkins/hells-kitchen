extends Area2D
var entered = false
export var NextScene : String

func _ready():
	$Open.visible = false
	# Chef = get_node("Chef")



func _on_Area2D_body_entered(body):
	if(body.lambSauce):
		$Closed.visible = false
		$Open.visible = true
		if(!entered):
			$Sting.play(0.25)
		entered = true
		print("You've won you fuck!")
		$Timer.start()
		
		# Chef.queue_free()
		


func _on_Timer_timeout():
	get_tree().change_scene("res://Level 2.tscn")
