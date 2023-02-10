extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var offset: Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	offset = translation
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	near = translation.z
	frustum_offset.x = -translation.x
	frustum_offset.y = -translation.y
	#x=90(1-.9999998)^{y}+11
	pass
