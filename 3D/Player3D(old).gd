extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var Sensitivity = Vector3(1,1,1)
var console

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	console = JavaScript.get_interface("console")
	#JavaScript.eval("alert('Calling JavaScript per GDScript!');")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#console.log("hello testing 2")
	var faceX = JavaScript.eval("centerX")
	var faceY = JavaScript.eval("centerY")
	var faceZ = JavaScript.eval("centerZ")
	
	faceZ = faceZ- 20
	#print(faceX) # prints '3.0'
	var lerpPos = .8
	var newPos = Vector3(-faceX,-faceY,faceZ)*Sensitivity
	translation = translation*(1-lerpPos) + newPos*lerpPos
	#position.x = faceX*-100 + get_viewport_rect().size.x/2
	#position.y = faceY*100 + get_viewport_rect().size.y/2
	#console.log("hello testing 4")
	
