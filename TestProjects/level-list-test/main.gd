extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(OS.get_data_dir())
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_dev_ui_create_new_sublevel() -> void:
	DevManager.createAnotherSublevel()
	DevManager.createGameSequence()
