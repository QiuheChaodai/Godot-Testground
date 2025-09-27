class_name Sublevel extends LCS

var PARAMNUM:int = 3
var SBLPATH:String = "res://LCS/Sublevels"

func _init(contentArray:Array):
	attributeNames.append("sblName")
	attributeNames.append("scenes")
	attributeNames.append("nextSbls")
	
	if(contentArray.size() != PARAMNUM):
		print("error: wrong size of input array")
	else:
		attributes = contentArray
		
		

func _ready() -> void:
	pass

'''
to load a map from the map scenes that this sublevel owns
'''
func loadMapScene(mapName:String) -> PackedScene:
	var thisDirectory:String = MAP_DIRECTORY + "/" + mapName + ".tscn"
	if !FileAccess.file_exists(thisDirectory):
		print("error: map scene file at: " + thisDirectory + " does not exist.")
		return null
	else:
		#TO INSTANTIATE MAP
		var targetMap:PackedScene = load(thisDirectory)
		return targetMap
		


#
