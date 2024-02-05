extends CharacterBody2D

const cell_size = 64
var target_x = 0
var target_y = 0
var movement_speed = 900

func _physics_process(delta):
	#print(delta)
	if Input.is_action_just_pressed("ui_left"):
		target_x -= cell_size
	elif Input.is_action_just_pressed("ui_right"):
		target_x += cell_size
	elif Input.is_action_just_pressed("ui_up"):
		target_y -= cell_size
	elif Input.is_action_just_pressed("ui_down"):
		target_y += cell_size
	
	
	#This is called tweening!!	
	#Diff vector
	var v = Vector2(target_x - position.x, target_y - position.y)
	#print(v)
	#Get length
	var d = v.length()
	#print(d)
	#Normalize vecotr (so the vector is 1 long)
	if movement_speed * delta > d:
		position.x = target_x
		position.y = target_y
	else:
		v = v.normalized()
		print(v,d)
		position.x += v.x * movement_speed * delta
		position.y += v.y * movement_speed * delta 
	#Multiply by speed: x_vel, y_vel
		#Multiply by delta
	#If length<speed * delta:
		#Make it the target	
	
	#if position.x < target_x: position.x += movement_speed * delta
	#if position.x > target_x: position.x -= movement_speed * delta
	#if position.y < target_y: position.y += movement_speed * delta
	#if position.y > target_y: position.y -= movement_speed * delta

	move_and_slide()
