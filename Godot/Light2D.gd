extends Light2D

const SPEED = 50


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var vec = get_viewport().get_mouse_position() # getting the vector from self to the mouset
	position = vec # move by that vector
	print(vec)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
