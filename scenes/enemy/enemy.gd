extends CharacterBody2D

const SPEED = 250.0
@onready var player = get_node("/root/main/player")

func _physics_process(delta: float) -> void:
	if player:
		velocity = (player.global_position - global_position).normalized() * SPEED
		look_at(player.global_position)
		move_and_slide()
