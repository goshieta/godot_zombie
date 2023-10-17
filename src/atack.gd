extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position+=get_meta("dirVector")*delta*get_meta("speed")
	if abs(position.x)>2000 or abs(position.y)>2000:
		queue_free()
	pass
