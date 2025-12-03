extends CharacterBody2D


@export var SPEED = 100.0
@export var ACCEL = 10.0
@export var FRICTION = 15.0
@export var direction = Vector2.ZERO

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction != Vector2.ZERO:
		velocity = lerp(velocity, direction * SPEED, ACCEL * delta)
	else:
		velocity = lerp(velocity, Vector2.ZERO, FRICTION * delta)
	move_and_slide()
