extends Control



func _on_iniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/escenas_de_testeo/test_level.tscn")
	pass # Replace with function body.



func _on_salir_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
