extends Node2D

@onready var heart_container: HBoxContainer = $HeartContainer
@onready var heart: TextureRect = $HeartContainer/Heart
@onready var heart_2: TextureRect = $HeartContainer/Heart2
@onready var heart_3: TextureRect = $HeartContainer/Heart3
@onready var heart_4: TextureRect = $HeartContainer/Heart4
@onready var heart_5: TextureRect = $HeartContainer/Heart5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.lives <= 0:
		get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
		return

	await Timer(0.5)

	if Global.minigames_done >= Global.TOTAL_MINIGAMES:
		get_tree().change_scene_to_file("res://scenes/win_screen.tscn")
	elif Global.lives <= 0:
		get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
	else:
		Global.minigames_done += 1
		get_tree().change_scene_to_file("res://scenes/minigame_" + str(Global.minigames_done) + ".tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match Global.lives: # asks or checks if lives is equal to one of 
#these values, cool hack. by the way this is a horrid way to illustrate the 
#lives visually so later you can always find alternative code. Now, dw abt it.

		4:
			heart.hide()
		3:
			heart.hide()
			heart_2.hide()
		2:
			heart.hide()
			heart_2.hide()
			heart_3.hide()
		1:
			heart.hide()
			heart_2.hide()
			heart_3.hide()
			heart_4.hide()
		0:
			heart_container.hide() # just hides everything
			
	timer.text = str(time)
	level.text = "Level " + str(Global.minigames_done)
		
func Timer(start_time: float):
	time = start_time
	
	while time > 0.0:
		await wait(0.1)
		time -= 0.1
		
	return
	
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
