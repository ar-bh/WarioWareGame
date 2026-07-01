extends Node2D

@export var time_limit := 10.0
@export var studs_required := 3

@onready var themed_timer: Node2D = $timer

var studs_collected := 0
var timer_end := false


func _ready() -> void:
	for child in get_children():
		if child.has_signal("stud_collected"):
			child.stud_collected.connect(_on_stud_collected)

	await themed_timer.Timer(time_limit)
	timer_end = true


func _process(_delta: float) -> void:
	if studs_collected >= studs_required:
		get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
		return

	if timer_end:
		_handle_loss()


func _on_stud_collected() -> void:
	studs_collected += 1


func _handle_loss() -> void:
	Global.lives -= 1
	Global.minigames_done = max(0, Global.minigames_done - 1)
	if Global.lives <= 0:
		get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
