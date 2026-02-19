extends CanvasLayer
class_name GameUI

const MEDAL_BRONZE = preload("res://Assets/Sprites/UI/medalBronze.png")
const MEDAL_SILVER = preload("res://Assets/Sprites/UI/medalSilver.png")
const MEDAL_GOLD = preload("res://Assets/Sprites/UI/medalGold.png")

@onready var score_label: Label = %ScoreLabel
@onready var start_menu: Control = %StartMenu
@onready var game_over_menu: VBoxContainer = %GameOverMenu

@onready var medal_img: TextureRect = %MedalImg
@onready var current_score: Label = %CurrentScore
@onready var high_score: Label = %HighScore

func _ready() -> void:
	score_label.text = "0"


func calculate_score(score: int, high: int):
	current_score.text = str(score)
	high_score.text = str(high)
	if score >= 20:
		medal_img.texture = MEDAL_GOLD
	elif score >= 10:
		medal_img.texture = MEDAL_SILVER
	else:
		medal_img.texture = MEDAL_BRONZE

func update_score(value: int) -> void:
	score_label.text = str(value)


func game_over() -> void:
	game_over_menu.show()
	score_label.hide()


func _on_play_button_pressed() -> void:
	get_tree().reload_current_scene()
