extends RigidBody3D

@export var backdash_speed = 1500
var cameraToggle = 0

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
	
	if Input.is_action_just_pressed("ui_enter"):
		if cameraToggle == 0:
			$Camera3D.position = Vector3(0, 0, 0)
			print("Woosh")
			cameraToggle += 1
		elif cameraToggle == 1:
			$Camera3D.position = Vector3(-1, 1, 0)
			rotate($Camera3D(.5))
			print("Woosh")
			cameraToggle += 1


		
	#if Input.is_action_just_pressed("ui_enter"):
		#$Camera3D.position = Vector3(5, 0, 5)
		#print($Camera3D.position)
	#if Input.is_action_just_pressed("ui_space"):
		#$Camera3D.position = Vector3(0, 0, 0)
		#print($Camera3D.position)
