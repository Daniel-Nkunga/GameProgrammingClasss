extends Camera3D

var rotation_point = Vector3(0, 0, 0) # Set your rotation point here
@export var mouse_sensitivity = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_a"):
		print("Vroom")
		
#func _input(event):
	#if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		#rotate_y(-event.relative.x * mouse_sensitivity)
		#print("Bananas")
		
