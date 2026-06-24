extends Area2D

@export var velocidad = 1000


func _process(delta: float) -> void:
	position += transform.y * velocidad * delta

func borrar_bala() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		await get_tree().create_timer(0.02).timeout
		borrar_bala()
	pass # Replace with function body.
