extends CharacterBody2D

const SPEED = 300.0
var kickback_power = 1500
var bulletPath = preload("res://Scenes/Bullet.tscn")

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
	$Node2D.look_at(get_global_mouse_position())
	#Shooting
	var mouse_position = get_global_mouse_position()
	if Input.is_action_just_pressed("mouse_click"):
		shoot()
		

	move_and_slide()

func shoot():
	var bullet = bulletPath.instantiate()
	get_parent().add_child(bullet)
	
	bullet.position = $Node2D/Marker2D.global_position		
	bullet.change_vel(get_global_mouse_position()-bullet.position)
	
	var mouse_position = get_global_mouse_position()
	var direction_to_mouse = (mouse_position - global_position).normalized()
	velocity -= direction_to_mouse * kickback_power
