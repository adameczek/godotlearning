extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


@onready var animated_sprite = $AnimatedSprite2D
var last_direction = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction != Vector2.ZERO:
		velocity = direction * 32.0
	else:
		velocity = Vector2.ZERO
	move_and_slide()
