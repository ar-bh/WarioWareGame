extends TextureButton

@onready var parent: Node2D = get_parent()


func _ready() -> void:
	pressed.connect(_on_pressed)


func _on_pressed() -> void:
	hide()
	parent.buttons_pressed += 1
