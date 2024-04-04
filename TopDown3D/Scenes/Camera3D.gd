extends Camera3D

var rotation_point = Vector3(0, 0, 0) # Set your rotation point here

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_a"):
		print("Vroom")
		
