extends Node

const TOTAL_MINIGAMES := 8

var minigames_done = 0
var lives = 5


func reset_game() -> void:
	minigames_done = 0
	lives = 5
