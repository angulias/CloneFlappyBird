extends Node2D

const SAVE_FILE: String = "user://score.dat"

@onready var spawner: Spawner = $Spawner
@onready var player: Player = $Player
@onready var game_ui: GameUI = $GameUI
@onready var ground: Ground = $Ground

var score: int
var high_score: int

func _ready() -> void:
	load_highscore()


func save_highscore() -> void:
	if score > high_score:
		high_score = score
		var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
		file.store_32(high_score)


func load_highscore() -> void:
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	if file:
		high_score = file.get_32()


func _on_player_on_game_started() -> void:
	spawner.timer.start()
	game_ui.start_menu.hide()


func _on_spawner_on_obstacle_crashed() -> void:
	player.stop_movement()
	ground.stop_ground()


func _on_ground_on_player_crashed() -> void:
	spawner.stop_obstacles()
	game_ui.calculate_score(score, high_score)
	game_ui.game_over()


func _on_spawner_on_player_score() -> void:
	score += 1
	game_ui.update_score(score)
	save_highscore()
