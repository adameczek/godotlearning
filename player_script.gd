extends CharacterBody2D


@export var SPEED = 100.0
@export var ACCEL = 10.0
@export var FRICTION = 15.0
#const JUMP_VELOCITY = -400.0


@onready var animated_sprite = $AnimatedSprite2D
var last_direction = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction != Vector2.ZERO:
		velocity = lerp(velocity, direction * SPEED, ACCEL * delta)
	else:
		velocity = lerp(velocity, Vector2.ZERO, FRICTION * delta)
	
	playerAnim(direction)
	move_and_slide()
	
func playerAnim(direction):
	$AnimatedSprite2D.flip_h = false # Don't change
	
	if direction == Vector2.RIGHT:
		$AnimatedSprite2D.play("walk_side")
	elif direction == Vector2.LEFT:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk_side")
	elif direction == Vector2.DOWN:
		$AnimatedSprite2D.play("walk_front")
	elif direction == Vector2.UP:
		$AnimatedSprite2D.play("walk_back")
	else:
		$AnimatedSprite2D.play("idle_front")
