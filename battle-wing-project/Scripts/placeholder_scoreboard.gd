extends Node2D

@export var texto_victoria: Label

func _ready() -> void:
	definir_ganador_general()
	volver_al_menu()


func definir_ganador_general():
	if Scoreboard.score_jugador_1 >= 3:
		definir_j1_ganador()
	elif Scoreboard.score_jugador_2 >= 3:
		definir_j2_ganador()
	else:
		hubo_empate()
	pass



func definir_j1_ganador():
	texto_victoria.text = "El jugador 1 ha ganado!!!!"
	pass

func definir_j2_ganador():
	texto_victoria.text = "El jugador 2 ha ganado!!!!"
	pass

func hubo_empate():
	texto_victoria.text = "Los jugadores empataron..."
	pass


func volver_al_menu() -> void:
	await get_tree().create_timer(5).timeout
	reiniciarme_la_puntuacion()
	get_tree().change_scene_to_file("res://Scenes/Menu_Principal.tscn")
	pass # Replace with function body.

func reiniciarme_la_puntuacion():
	Scoreboard.score_jugador_1 = 0
	Scoreboard.score_jugador_2 = 0
