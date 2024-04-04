extends RigidBody3D

@export var backdash_speed = 1500
var cameraToggle = 1

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	var input := Vector3.ZERO
	input.x = Input.get_axis("ui_left", "ui_right")
	input.z = Input.get_axis("ui_up", "ui_down")
	apply_central_force((input * 1200.0 * delta))
	
	if Input.is_action_just_pressed("ui_enter"):
		if cameraToggle == 0:
			$Camera3D.position = Vector3(0, 0, 0)
			cameraToggle += 1
		elif cameraToggle == 1:
			$Camera3D.position = Vector3(0, 1.5, 3)
			$Camera3D.rotate(Vector3(0, 1.5, 3), deg_to_rad(-45))
			cameraToggle += 1
		elif cameraToggle == 2:
			$Camera3D.position = Vector3(0, .5, 1)
			$Camera3D.rotate(Vector3(0, 0.5, 1), deg_to_rad(0))
			cameraToggle = 0
