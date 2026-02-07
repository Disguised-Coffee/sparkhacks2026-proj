extends CharacterBody2D

var speed: int = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("down"):
		velocity = Vector2(0, 25) * speed
		move_and_slide()
	elif Input.is_action_pressed("up"):
		velocity = Vector2(0, -25) * speed
		move_and_slide()
	elif Input.is_action_pressed("left"):
		velocity = Vector2(-25, 0) * speed
		move_and_slide()
	elif Input.is_action_pressed("right"):
		velocity = Vector2(25, 0) * speed
		move_and_slide()
