extends Label

var elapsed_time : float = 0.0
var total: float = 60.0

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set the initial time value
	update_timer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Update elapsed time
	elapsed_time += delta
	
	# Check if the countdown is still running
	if elapsed_time < total:
		update_timer()

# Function to update the timer display
func update_timer() -> void:
	# Calculate remaining time
	var remaining_time : float = total - elapsed_time
	
	# Display remaining time in the label
	text = str(ceil(remaining_time))  # Using ceil to round up to the nearest second
