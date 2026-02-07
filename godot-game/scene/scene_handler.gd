extends Node

@export var main_menu_packed: PackedScene
@export var game_scene_packed: PackedScene

func _ready() -> void:
	load_main_menu("game_start")


func load_main_menu(origin: String) -> void:
	var main_menu: Control = main_menu_packed.instantiate()
	main_menu.start_game_pressed.connect(start_game)
	main_menu.exit_pressed.connect(exit_game)
	add_child(main_menu)

func start_game(origin:String) -> void:
	if origin == "main_menu":
		get_node("MainMenu").queue_free()
	var game_scene: Node2D = game_scene_packed.instantiate()
	add_child(game_scene)

func exit_game(_origin: String) -> void:
	get_tree().quit()
