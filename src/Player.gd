extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var _time=0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	const SCALE_INDEX=0.1
	_time+=delta*3
	var _scale_all=sin(_time)*SCALE_INDEX+1.1
	scale=Vector2(_scale_all,_scale_all)
	
