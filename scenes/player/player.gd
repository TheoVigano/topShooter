extends CharacterBody2D

@onready var is_reloading = false

const SPEED = 300

var bullet_scene = preload("res://scenes/bullet/bullet.tscn")

func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	velocity.x = Input.get_axis("left", "right", ) * SPEED
	velocity.y = Input.get_axis("up", "down",) * SPEED
	velocity = lerp(get_real_velocity(), velocity, 0.5)
	move_and_slide()
	
	if (Input.is_action_just_pressed("shoot")):
		var bullet = bullet_scene.instantiate()
		bullet.global_position = $Polygon2D_weapon.global_position
		bullet.direction = (get_global_mouse_position() - global_position).normalized()
		get_tree().get_root().add_child(bullet)
	
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		if collision.get_collider().is_in_group("enemies"):
			if(!is_reloading):
				is_reloading = true
				get_tree().reload_current_scene()
