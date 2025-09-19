class_name GameSequence


var levelArray = Array()
var currentLevel = null
var currentSublevel:Sublevel = null

func _init(levels:Array):
	levelArray = levels
	
'''
the following are for creating a GameSequence Object, which should not be used.
'''

func saveDict() -> Dictionary:
	var dict_saveContent = {
		"levelArray" : levelArray,
	}
	return dict_saveContent

func saveThis():
	var savePath:String = "user://LCS/GameSequence.lcssave"
	var saveAccess = FileAccess.open(savePath, FileAccess.WRITE)
	if saveAccess == null:
		print("FAILED TO GET SAVE FILE")
	else:
		var saveDataJson = JSON.stringify(saveDict())
		saveAccess.store_line(saveDataJson)
