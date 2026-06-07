extends Area2D

@export var velocidad = 1000

func _process(delta: float) -> void:
	position += transform.y * velocidad * delta

func borrar_bala() -> void:
	queue_free()



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("jugador"):
		queue_free()
	pass # Replace with function body.
