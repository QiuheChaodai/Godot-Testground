extends Control

signal buttonAPressed

func _on_button_pressed() -> void:
	buttonAPressed.emit()
