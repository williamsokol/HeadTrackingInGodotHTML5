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
	var objectW = 18
	var objectH = objectW * .4
	
	translation.z = clamp(offset.z,4,100)
	fov = 2*(90-rad2deg(atan((2*translation.z)/objectW)))
	
	size = (objectW*near/ translation.z)
	#frustum_focal_length
	#near = translation.z
	
	#print()

	
	translation.x = clamp(offset.x, -objectW/2,objectW/2)
	translation.y = clamp(offset.y, -objectH/2,objectH/2)
	frustum_offset.x = -(translation.x*near/ translation.z)
	frustum_offset.y = -(translation.y*near/ translation.z)
	#x=90(1-.9999998)^{y}+11
	pass
