extends RigidBody3D

@export var backdash_speed = 1500
var cameraToggle = 1
@export var mouse_sensitivity = .25
var camera_anglev = 0
@onready var neck := $Neck
@onready var camera := $Neck/Camera3D

#func _unhandled_input(event: InputEvent) > void:
	#if event in InputEventMouseMotion:
		#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURE)
	#elif event.is_action_pressed("ui_cancel"):
		#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	 #and Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
func _process(delta: float) -> void:
	var input := Vector3.ZERO
	input.x = Input.get_axis("ui_left", "ui_right")
	input.z = Input.get_axis("ui_up", "ui_down")
	apply_central_force((input * 1200.0 * delta))
	
	
	if Input.is_action_just_pressed("ui_enter"):
		if cameraToggle == 0:
			$Neck/Camera3D.position = Vector3(0, 0, 0)
			cameraToggle += 1
		elif cameraToggle == 1:
			$Neck/Camera3D.position = Vector3(0, 1.5, 3)
			$Neck/Camera3D.rotate(Vector3(0, 1.5, 3), deg_to_rad(-45))
			cameraToggle = 0
			
#Drunk camera
#func _input(event):
	#if event is InputEventMouseMotion:
		#$Neck/Camera3D.rotate_x(deg_to_rad(-event.relative.x * mouse_sensitivity))
		#var changev = -event.relative.y * mouse_sensitivity
		#if camera_anglev + changev > -50 and camera_anglev + changev < 50:
			#camera_anglev += changev
			#$Neck/Camera3D.rotate_y(deg_to_rad(changev))
		
		
##"You'd lose you head if it wasn't attached to you
func _input(event):
	if event is InputEventMouseMotion:
		$Neck/Camera3D.rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity))
		var changev = -event.relative.y * mouse_sensitivity
		if camera_anglev + changev > -50 and camera_anglev + changev < 50:
			camera_anglev += changev
			$Neck/Camera3D.rotate_x(deg_to_rad(changev))
			#
#func _input(event):
	#if event is InputEventMouseMotion:
		#$Neck/Camera3D.rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity))
		#var changev = -event.relative.y * mouse_sensitivity
		#if camera_anglev + changev > -50 and camera_anglev + changev < 50:
			#camera_anglev += changev
			#rotate_y(deg_to_rad(changev))
			

#func _unhandled_input(event):
	#if event is InputEventMouseMotion:
		#$Camera3D.rotate_y(-event.relative.x * mouse_sensitivity)
		#$Camera3D.rotate_x(-event.relative.y * mouse_sensitivity)
		#$Camera3D.rotation.x = clamp($Camera3D.rotation.x, deg_to_rad(-40), deg_to_rad(60))


