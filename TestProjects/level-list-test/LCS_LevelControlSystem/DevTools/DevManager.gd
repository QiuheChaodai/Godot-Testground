'''
DEV TOOL FOR LCS
this is run globally.
'''

extends Node

var sublevelCount:int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


'''
functions that would create new .lcssave files for GameSequence, Level and Sublevel.
'''

func createGameSequence():
	var levels = Array()
	var newGameSequence = GameSequence.new(levels)
	newGameSequence.saveThis()


#TO CREATE ANOTHER SUBLEVEL AND SAVE IT AT user://LCS/Sublevel
func createAnotherSublevel():
	var newName = "Sublevel" + str(sublevelCount)
	var mapArray = Array()
	var nextSublevelArray = Array()
	
	var newSublevel:Sublevel = Sublevel.new(newName, mapArray, nextSublevelArray)
	newSublevel.saveThis()
	sublevelCount += 1
	
	
