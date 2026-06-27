extends ColorRect

# Target radius you want to reach
var target_radius: float = 1000.0

# How fast the transition happens
@export var change_speed: float = 2.0

func _process(delta: float) -> void:
	# Get the current radius value from the shader
	var current_radius: float = material.get_shader_parameter("radius")
	
	# Smoothly interpolate toward the target radius
	var new_radius: float = lerp(current_radius, target_radius, change_speed * delta)
	
	# Apply the new value back to the shader uniform
	material.set_shader_parameter("radius", new_radius)

# Call this function from external scripts to trigger the change
func update_vignette_radius(new_value: float) -> void:
	target_radius = clamp(new_value, 0.0, 1.5)
