extends Area2D

signal coinColected


func _on_coin2d_body_entered(body):
	
	emit_signal("coinColected")
	queue_free()
	pass # Replace with function body.
