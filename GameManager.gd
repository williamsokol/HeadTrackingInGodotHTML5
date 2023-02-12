extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var currentOpenScene:Node
var scenes = [
	preload("res://3D/3DRoomScene.tscn"),
	preload("res://3D/3DScene.tscn"),
	preload("res://2D/Node2D.tscn"),
	preload("res://3D/3DRoomScene(old).tscn")
	]
var descriptions = [
	"Room with Face tracking and frustum offsetting",
	"Object with Face tracking and frustum offsetting",
	"2D object with face tracking",
	"3D face tracking with normal perspective camera"
	]
var sceneNum = 0
var btn1
var btn2
var text
var callback = JavaScript.create_callback(self, "ChangeScene")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	loadScene(sceneNum)
	# get_interface is getting html element by id
	text = JavaScript.get_interface('selectText')
	btn1 = JavaScript.get_interface('rightButton')
	btn2 = JavaScript.get_interface('leftButton')
	
	btn1.onclick = callback
	btn2.onclick = callback


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	if(Input.is_action_just_pressed("next")):
		sceneNum = (sceneNum+1)%scenes.size()
		ChangeScene(1)
	if(Input.is_action_just_pressed("prev")):
		ChangeScene(-1)
		
func loadScene(sceneNum):
	if(currentOpenScene != null):
		currentOpenScene.queue_free()
	
	var instance = scenes[sceneNum].instance()
	add_child(instance)
	
	currentOpenScene = instance
		
func ChangeScene(diff):
	if(typeof(diff) == TYPE_INT):
		sceneNum = (sceneNum+diff)%scenes.size()
	else:
		var id = str(diff[0].target.id)
		print(id)
		if id == "rightButton":
			sceneNum = (sceneNum+1)%scenes.size()
		else:
			sceneNum = (sceneNum-1)%scenes.size()
		
	text.textContent = descriptions[sceneNum]
	loadScene(sceneNum)

