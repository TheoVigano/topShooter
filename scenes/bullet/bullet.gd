extends Area2D

var direction: Vector2
const SPEED = 10
var explosion_scene = preload("res://scenes/explosion/explosion.tscn")

func _ready() -> void:
	pass 
func _process(delta: float) -> void:
	pass


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()

func _physics_process(delta: float) -> void:
	global_position += direction * SPEED


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		var explosion = explosion_scene.instantiate()
		explosion.global_position = body.global_position
		get_parent().add_child(explosion)
		explosion.emitting = true

		body.queue_free()
		queue_free()
