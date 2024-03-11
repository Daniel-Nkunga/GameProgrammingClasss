extends RigidBody3D

@export var backdash_speed = 1500

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	var input := Vector3.ZERO
	input.x = Input.get_axis("ui_left", "ui_right")
	input.z = Input.get_axis("ui_up", "ui_down")
	apply_central_force((input * 1200.0 * delta))

	if Input.is_action_just_pressed("mouse_left"):
		var global_mouse_pos = get_viewport().get_mouse_position()
		var local_mouse_pos = global_mouse_pos - global_transform.origin
		apply_central_force(-local_mouse_pos.normalized() * 1500 * delta)
		print("bang!")
