extends Node2D


func _on_play_again_pressed() -> void:
	Global.reset_game()
	get_tree().change_scene_to_file("res://scenes/title_scene.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
