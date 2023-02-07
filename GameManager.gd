extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var currentOpenScene:Node
var scenes = [
	preload("res://2D/Node2D.tscn"),
	preload("res://3D/3DScene.tscn"),
	preload("res://3D/3DRoomScene.tscn")
	]
var sceneNum = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	loadScene(sceneNum)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	if(Input.is_action_just_pressed("next")):
		sceneNum = (sceneNum+1)%scenes.size()
		loadScene(sceneNum)
		
func loadScene(sceneNum):
	if(currentOpenScene != null):
		currentOpenScene.queue_free()
	
	var instance = scenes[sceneNum].instance()
	add_child(instance)
	
	currentOpenScene = instance
		
		
