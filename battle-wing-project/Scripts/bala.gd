extends Area2D

@export var velocidad = 1000

func _process(delta: float) -> void:
	position += transform.y * velocidad * delta



func borrar_bala() -> void:
	queue_free()
	print("bala borrada")
	pass # Replace with function body.
