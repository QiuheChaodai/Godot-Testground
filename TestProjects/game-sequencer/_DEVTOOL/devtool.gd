extends Node

signal makeGSData

func _on_ui_to_create_gs_data() -> void:
	makeGSData.emit()


func _on_ui_to_save_gs_data() -> void:
	$"../GameSequencer".saveGSToFile()
	


func _on_ui_to_show_gs_data_runtime() -> void:
	var dict = $"../GameSequencer".dict_Levels
	for n in (dict.keys().size()):
		print(dict.keys()[n])


func _on_ui_load_map() -> void:
	var loadedMapNode:Node3D = $"../GameSequencer".loadNextMap()
	if loadedMapNode == null:
		print("FAILED TO LOAD")
	else:
		print("LOAD SUCCESSFUL")
