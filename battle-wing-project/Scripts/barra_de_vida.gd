extends ProgressBar

@export var jugador:CharacterBody2D

func _ready() -> void:
	jugador.Cambio_de_vida.connect(actualizar)
	actualizar()
	pass

func actualizar():
	value = jugador.vida_actual * 100 / jugador.vida
