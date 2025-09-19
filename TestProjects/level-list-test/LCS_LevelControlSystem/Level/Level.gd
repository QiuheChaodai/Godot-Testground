'''
This represents one whole Level, or mission.
'''
class_name Level

var levelName:String
var nextLevel = Array()#an array of the next Levels this level can go to.

func _init(myName:String, nextL:Array) -> void:
	levelName = myName
	nextLevel = nextL

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
'''
called to enter this sublevel
Prerequisite: ALL map scenes must be put under a certain folder.
this function will access the corresponding map by the parameter: stat, starting from 0.
the function will attempt to:
	1) find the corresponding map.
	2) if map scene is found, remove the current map scene.
	3) instantiate the corresponding map scene. For this example, it is instantiated into main node.
	4) take player to that node. However, this example does not have a player node, so not yet.
'''	
	
'''
THE FOLLOWING FUNCTIONS ARE THERE FOR DEV PURPOSES, DON'T CALL
'''
func saveDict() -> Dictionary:
	var dict_saveContent = {
		"levelName" : levelName,
		"nextLevel" : nextLevel
	}
	return dict_saveContent

'''
READ THIS CAREFULLY.
Under the user:// directory, create folder: LCS/Sublevel to make this work.
Godot can create new files for you, but apparently it cannot make new folders for you,
so make sure you have all the folders ready.
'''


func saveThis():
	var savePath:String = "user://LCS/Level/" + levelName + ".lcssave"
	var saveAccess = FileAccess.open(savePath, FileAccess.WRITE)
	if saveAccess == null:
		print("FAILED TO GET SAVE FILE")
	else:
		var saveDataJson = JSON.stringify(saveDict())
		saveAccess.store_line(saveDataJson)
