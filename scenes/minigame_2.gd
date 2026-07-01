extends Node2D
@onready var themed_timer: Node2D = $timer

var buttons_pressed := 0
var timer_end = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await themed_timer.Timer(7.0)
	timer_end = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if buttons_pressed == 7:
		get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
		return

	if timer_end:
		Global.lives -= 1
		Global.minigames_done = max(0, Global.minigames_done - 1)
		if Global.lives <= 0:
			get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
