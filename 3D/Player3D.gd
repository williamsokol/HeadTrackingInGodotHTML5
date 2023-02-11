extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var Sensitivity = Vector3(1,1,1)
export var facetracking = false
var console

var faceX = JavaScript.eval("centerX")
var faceY = JavaScript.eval("centerY")
var faceZ = JavaScript.eval("centerZ")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	console = JavaScript.get_interface("console")
	#JavaScript.eval("alert('Calling JavaScript per GDScript!');")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#console.log("hello testing 2")
	var lerpPos = .8
	var newPos
	if(facetracking):
		faceX = JavaScript.eval("centerX")
		faceY = JavaScript.eval("centerY")
		faceZ = JavaScript.eval("centerZ")
		faceZ = faceZ - 20
		#print()
		#print(faceX) # prints '3.0'
		newPos = Vector3(-faceX,-faceY,faceZ)*Sensitivity
		#newPos.z += 10
	else:
		newPos = $Camera.translation +(keyMovements()*delta*10) 
		
	$Camera.translation = $Camera.translation*(1-lerpPos) + newPos*lerpPos
	#position.x = faceX*-100 + get_viewport_rect().size.x/2
	#position.y = faceY*100 + get_viewport_rect().size.y/2
	#console.log("hello testing 4")
	
func keyMovements():
	var dir:Vector3
	if(Input.is_action_pressed("forward")):
		dir.z -= 1
	if(Input.is_action_pressed("backward")):
		dir.z += 1
	if(Input.is_action_pressed("up")):
		dir.y += 1
	if(Input.is_action_pressed("down")):
		dir.y -= 1
	if(Input.is_action_pressed("left")):
		dir.x -= 1
	if(Input.is_action_pressed("right")):
		dir.x += 1
	return dir

	
	