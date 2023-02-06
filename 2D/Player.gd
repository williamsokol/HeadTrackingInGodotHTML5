extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

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
	#print(faceX) # prints '3.0'
	position.x = faceX*-100 + get_viewport_rect().size.x/2
	position.y = faceY*100 + get_viewport_rect().size.y/2
	#console.log("hello testing 4")

