extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var facetracking = true
var Sensitivity = Vector3(-1,-1,1)
var console

var faceInput:Vector3


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
		faceInput.x = JavaScript.eval("centerX")
		faceInput.y = JavaScript.eval("centerY")
		faceInput.z = JavaScript.eval("centerZ")
		
		faceInput.z = map(faceInput.z, 12,50,7,80)
		
		newPos = faceInput*Sensitivity
		#newPos.z += 10
	else:
		newPos = $Camera.offset +(keyMovements()*delta*10) 
		
	#print(newPos)
	$Camera.offset = $Camera.offset*(1-lerpPos) + newPos*lerpPos
	#position.x = faceX*-100 + get_viewport_rect().size.x/2
	#position.y = faceY*100 + get_viewport_rect().size.y/2
	#console.log("hello testing 4")

# alternative way to move around for testing
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

func map(x, in_min, in_max, out_min, out_max):
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;

	
