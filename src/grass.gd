extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var rng=RandomNumberGenerator.new()
	rng.randomize()
	var load_number=rng.randi_range(1,4)
	var chara_tex=load('res://assets/img/grass'+str(load_number)+'.png')
	texture=chara_tex
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
