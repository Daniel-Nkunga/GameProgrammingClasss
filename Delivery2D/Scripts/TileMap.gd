extends TileMap

var oneWayCollisionBelow = false

func set_one_way_collision_below(enable):
	oneWayCollisionBelow = enable

func _on_TileMap_body_entered(body):
	# Check if the entered body is the player character
	if body.is_in_group("player") and oneWayCollisionBelow:
		# Disable collision with the player from the top
		body.set_one_way_collision("up", false)

func _on_TileMap_body_exited(body):
	# Check if the exited body is the player character
	if body.is_in_group("player") and oneWayCollisionBelow:
		# Enable collision with the player from the top
		body.set_one_way_collision("up", true)
