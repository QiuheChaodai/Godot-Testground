extends Control

signal toCreateGSData
signal toSaveGSData
signal toShowGSDataRuntime
signal loadMap


func _on_create_gs_data_pressed() -> void:
	toCreateGSData.emit()


func _on_save_gs_data_pressed() -> void:
	toSaveGSData.emit()


func _on_show_gs_data_runtime_pressed() -> void:
	toShowGSDataRuntime.emit()


func _on_load_map_node_pressed() -> void:
	loadMap.emit()
