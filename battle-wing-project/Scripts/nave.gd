extends CharacterBody2D

@export var aceleracion = 7.5
@export var vel_rotacion = 150
@export var velocidad_maxima = 400
@export var vida:int = 5

@onready var bala = preload("res://Scenes/Objetos/bala.tscn")
@onready var tamano_pantalla = get_viewport_rect().size
@onready var canion = $canion

func Aceleracion():
	var input_vector := Vector2(0, Input.get_action_strength("Acelerar"))
	velocity += input_vector.rotated(rotation) * aceleracion
	
	if input_vector.y == 0:
		velocity = velocity.move_toward(Vector2.ZERO, 3)
	
	velocity = velocity.limit_length(velocidad_maxima)
	
	pass

func Rotacion(delta):
	if Input.is_action_pressed("Girar_Derecha"):
		rotate(deg_to_rad(vel_rotacion*delta))
	if Input.is_action_pressed("Girar_Izquierda"):
		rotate(-deg_to_rad(vel_rotacion*delta))
	pass

func disparar():
	
	if Input.is_action_just_pressed("Disparar"):
		var spawnear_bala = bala.instantiate()
		get_tree().root.add_child(spawnear_bala)
		spawnear_bala.global_position = canion.global_position
		spawnear_bala.rotation = rotation

func screen_wrap():
	position.x = wrapf(position.x, 0, tamano_pantalla.x)
	position.y = wrapf(position.y, 0, tamano_pantalla.y)
	pass



func _physics_process(delta: float) -> void:
	Aceleracion()
	Rotacion(delta)
	disparar()
	
	screen_wrap()
	move_and_slide()

func recibir_danio() -> void:
	vida -= 1
	print("daño recibido")
	print(vida)
	if vida <= 0:
		queue_free()
		print("borrando")



func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bala"):
		print("He detectado una bala")
		recibir_danio()
	pass # Replace with function body.
