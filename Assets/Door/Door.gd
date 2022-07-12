extends Area2D
var entered = false
var Chef

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
		# Chef.queue_free()
		
