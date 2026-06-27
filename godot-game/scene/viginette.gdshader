shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform vec4 vignette_color : source_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform float radius : hint_range(0.0, 1.5) = 0.75;
uniform float softness : hint_range(0.0, 1.0) = 0.45;

void fragment() {
    // Calculate distance from center (0.5, 0.5)
    vec2 center = UV - vec2(0.5);
    float dist = length(center);
    
    // Smoothstep creates the vignette gradient
    float vignette = smoothstep(radius, radius - softness, dist);
    
    // Apply the vignette effect over the screen
    vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV); // Godot 3.x use SCREEN_TEXTURE
    // For Godot 4.x, replace the line above with: vec4 color = texture(screen_texture, SCREEN_UV);
    
    COLOR.rgb = mix(vignette_color.rgb, color.rgb, vignette);
    COLOR.a = vignette_color.a;
}
