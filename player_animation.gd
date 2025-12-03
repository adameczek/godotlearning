extends Node2D


@export var animation_tree: AnimationTree
@onready var player: CharacterBody2D = get_owner()

var last_facing_direction := Vector2(0, 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.direction != Vector2.ZERO:
		last_facing_direction = player.direction
	
	animation_tree.set("parameters/walk/blend_position", last_facing_direction)
	animation_tree.set("parameters/idle/blend_position", last_facing_direction)
