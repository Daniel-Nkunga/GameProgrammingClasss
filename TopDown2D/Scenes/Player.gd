extends CharacterBody2D

const SPEED = 300.0
var kickback_power = 1450.0

func _physics_process(delta):
	
	#Debugging movement
	var directionx = Input.get_axis("ui_left", "ui_right")
	if directionx:
		velocity.x = directionx * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var directiony = Input.get_axis("ui_up", "ui_down")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = directiony * SPEED
		
	#Shooting
	var mouse_position = get_global_mouse_position()
	if Input.is_action_just_pressed("mouse_click"):
		#print(mouse_position)
		#print("BANG!")
		kickback()

	move_and_slide()

func kickback():
	var mouse_position = get_global_mouse_position()
	var direction_to_mouse = (mouse_position - global_position).normalized()
	velocity -= direction_to_mouse * kickback_power
	
