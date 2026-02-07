extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value = 0.0 # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (value < 100.0):
		value += 1 * delta
