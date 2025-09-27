'''
The parent class of all the children classes in LCS.
Contains many of the functions that are to be used.
This is itself an abstract class.
'''

@abstract
class_name LCS

var MAP_DIRECTORY:String = "res://MapScenes"#this is subject to change.

#stores attribute names in String values (String type only)
var attributeNames:Array = Array()
#stores the attribute values (Variant)
var attributes:Array = Array()

func readSave(savePath:String) -> Array:
	if !FileAccess.file_exists(savePath):
		print("error: file not found.")
		return Array()
	
	var saveContent:Array = Array()
	var saveFile = FileAccess.open(savePath, FileAccess.READ)
	
	var jsonString = ""
	while saveFile.get_position() < saveFile.get_length():
		jsonString = saveFile.get_line()
		saveContent.append(jsonString)
	return saveContent
	
func createSaveContent():
	var dict_saveContent = {}
	for n in range(attributeNames.size()):
		dict_saveContent[attributeNames[n]] = attributes[n]
	return dict_saveContent
	
func saveTo(savePath:String):
	var saveAccess = FileAccess.open(savePath, FileAccess.WRITE)
	var jsonString = JSON.stringify(createSaveContent())
	saveAccess.store(jsonString)
	
