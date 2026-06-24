extends Node
class_name manager_estado_del_juego

@export var jugador1: CharacterBody2D
@export var jugador2: CharacterBody2D
@export var label_score_j1: Label
@export var label_score_j2: Label
@export var camera: Camera2D



func _ready() -> void:
	jugador1.confirmar_muerte.connect(jugador_muerto_1)
	jugador2.confirmar_muerte.connect(jugador_muerto_2)
	
	
	
	label_score_j1.text = "Jugador 1: " + str(Scoreboard.score_jugador_1)
	label_score_j2.text = "Jugador 2: " + str(Scoreboard.score_jugador_2)

func jugador_muerto_1():
	Scoreboard.score_jugador_2 += 1
	camera.trigger_shake()
	check_partida()
	pass

func jugador_muerto_2():
	Scoreboard.score_jugador_1 += 1
	camera.trigger_shake()
	check_partida()
	pass


func check_partida():
	await get_tree().create_timer(3).timeout
	if Scoreboard.score_jugador_1 >= 3 or Scoreboard.score_jugador_2 >= 3:
		get_tree().change_scene_to_file("res://Scenes/escenas_de_testeo/placeholder_scoreboard.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/escenas_de_testeo/test_level.tscn")
