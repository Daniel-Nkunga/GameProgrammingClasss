extends CharacterBody2D

const base_gravity = 500
@export var speed = 175
@export var gravity = base_gravity
@export var jump_height = -250
var is_jumping = false
var jump_count = 0
@export var dash_distance = 35
var dash_cooldown = 0
@export var dash_timer = 30

func _physics_process(delta):
	velocity.y += gravity * delta
	horizontal_movement()
	move_and_slide()

	if !is_jumping:
		player_animations()

func horizontal_movement():
	var horizontal_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = horizontal_input * speed

func player_animations():
	if dash_cooldown >= 0:
		dash_cooldown -= 1
		#print(dash_cooldown)
		
	if Input.is_action_pressed("ui_left") || Input.is_action_just_released("ui_jump"):
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("run")

	if Input.is_action_pressed("ui_right") || Input.is_action_just_released("ui_jump"):
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("run")

	if !Input.is_anything_pressed():
		$AnimatedSprite2D.play("idle")
	 
	if Input.is_action_just_pressed("ui_jump") and jump_count <= 0: #This is jank. Why isn't this one???
		jump_count += 1
		velocity.y = jump_height
		$AnimatedSprite2D.play("jump")
	
	if Input.is_action_just_pressed("ui_dash") and Input.is_action_pressed("ui_right") and dash_cooldown <= 0:
		dash_cooldown = dash_timer
		#print(dash_cooldown)
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("jump")
		position.x += dash_distance
	
	if Input.is_action_just_pressed("ui_dash") and Input.is_action_pressed("ui_left") and dash_cooldown <= 0:
		dash_cooldown = dash_timer
		#print(dash_cooldown)
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("jump")
		position.x -= dash_distance

	if is_on_floor():
		jump_count = 0
	else:
		gravity = base_gravity
		

