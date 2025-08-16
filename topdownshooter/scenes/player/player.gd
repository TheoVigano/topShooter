extends CharacterBody2D

const SPEED = 300

func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	velocity.x = Input.get_axis("left", "right", ) * SPEED
	velocity.y = Input.get_axis("up", "down",) * SPEED
	velocity = lerp(get_real_velocity(), velocity, 0.5)
	move_and_slide()
