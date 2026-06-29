extends Node2D

@export var time_limit := 7.0
@export var buttons_required := 7

@onready var themed_timer: Node2D = $timer

var buttons_pressed := 0
var timer_end := false


func _ready() -> void:
	await themed_timer.Timer(time_limit)
	timer_end = true


func _process(_delta: float) -> void:
	if buttons_pressed >= buttons_required:
		get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
		return

	if timer_end:
		_handle_loss()


func _handle_loss() -> void:
	Global.lives -= 1
	Global.minigames_done = max(0, Global.minigames_done - 1)
	if Global.lives <= 0:
		get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
