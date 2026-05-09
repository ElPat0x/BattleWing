extends CharacterBody2D

@export var aceleracion = 7.5
@export var vel_rotacion = 50
@export var velocidad_maxima = 400

@onready var tamano_pantalla = get_viewport_rect().size

func Aceleracion():
	var input_vector := Vector2(0, Input.get_action_strength("Acelerar"))
	velocity += input_vector.rotated(rotation) * aceleracion
	
	if input_vector.y == 0:
		velocity = velocity.move_toward(Vector2.ZERO, 3)
	
	velocity = velocity.limit_length(velocidad_maxima)
	
	pass

func Rotacion(delta):
	if Input.is_action_pressed("Girar_Derecha"):
		rotate(deg_to_rad(velocidad_maxima*delta))
	if Input.is_action_pressed("Girar_Izquierda"):
		rotate(-deg_to_rad(velocidad_maxima*delta))
	pass

func screen_wrap():
	position.x = wrapf(position.x, 0, tamano_pantalla.x)
	position.y = wrapf(position.y, 0, tamano_pantalla.y)
	pass

func _physics_process(delta: float) -> void:
	Aceleracion()
	Rotacion(delta)
	screen_wrap()
	move_and_slide()
