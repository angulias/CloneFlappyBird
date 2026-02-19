extends Node2D
class_name Obstacle

signal on_player_crashed
signal on_player_score

@export var move_speed: float = 150.0

@onready var hit_sound: AudioStreamPlayer = $HitSound
@onready var score_sound: AudioStreamPlayer = $ScoreSound

func _process(delta: float) -> void:
	position.x -= move_speed * delta


func set_speed(value: float) -> void:
	move_speed = value


func _on_area_body_entered(_body: Node2D) -> void:
	on_player_crashed.emit()
	hit_sound.play()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_score_area_body_entered(_body: Node2D) -> void:
	on_player_score.emit()
	score_sound.play()
