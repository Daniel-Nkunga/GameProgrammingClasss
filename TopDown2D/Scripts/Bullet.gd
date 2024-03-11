extends CharacterBody2D

@onready var bullet_velocity = Vector2(0, 1)
var speed = 300

func change_vel(vel):
	bullet_velocity = vel


func _physics_process(delta):
	var collision_info = move_and_collide(bullet_velocity.normalized() * delta * speed)

