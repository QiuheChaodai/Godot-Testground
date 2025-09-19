'''
This represents a single "Sublevel". Think of this as a single room in Hades (man I never played that but I think this is the case),
or a single scene you get in MGS3 Snake Eater (the old one not the Konami remake).

As opposed to this, a Level is a whole set of experience - Think of it like a mission in Devil May Cry, or a Chapter in Mafia, or a 
"level" in one of those LEGO games.

'''

class_name Sublevel

signal loadNextMap

var sublevelName:String
var mapArray = Array()#an array of map scene names that players can go into and play in this particular sublevel.
var nextSublevel = Array()#an array of the next Sublevel names that this Sublevel may go to.

func _init(myName:String, maps:Array, nextSL:Array) -> void:
	sublevelName = myName
	mapArray = maps
	nextSublevel = nextSL

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

func enterRequest(stat:int):
	if stat >= mapArray.size():
		print("error: entering a map beyond the mapArray's range.")
		#presumably exit by this point. check for backend coding errors.
	else:
		loadNextMap.emit()
		
	
'''
THE FOLLOWING FUNCTIONS ARE THERE FOR DEV PURPOSES, DON'T CALL
'''
func saveDict() -> Dictionary:
	var dict_saveContent = {
		"sublevelName" : sublevelName,
		"mapArray" : mapArray,
		"nextSublevel" : nextSublevel
	}
	return dict_saveContent

'''
READ THIS CAREFULLY.
Under the user:// directory, create folder: LCS/Sublevel to make this work.
Godot can create new files for you, but apparently it cannot make new folders for you,
so make sure you have all the folders ready.
'''


func saveThis():
	var savePath:String = "user://LCS/Sublevel/" + sublevelName + ".lcssave"
	var saveAccess = FileAccess.open(savePath, FileAccess.WRITE)
	if saveAccess == null:
		print("FAILED TO GET SAVE FILE")
	else:
		var saveDataJson = JSON.stringify(saveDict())
		saveAccess.store_line(saveDataJson)
