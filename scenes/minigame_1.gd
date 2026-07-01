extends Node2D

@onready var themed_timer: Node2D = $timer
# Called when the node enters the scene tree for the first time.

var studs_collected = 0
var timer_end = false

func _ready() -> void:
	for stud in [$Stud, $Stud2, $Stud3]:
		stud.stud_collected.connect(stud_collect)

	await themed_timer.Timer(10.0)

	timer_end = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if studs_collected == 3:
		get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
		return

	if timer_end:
		Global.lives -= 1
		Global.minigames_done = max(0, Global.minigames_done - 1)
		if Global.lives <= 0:
			get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
		
func stud_collect() -> void:
	studs_collected += 1
	return
