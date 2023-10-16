extends Node2D
# 敵を作成する
var enemy_scene=load("res://src/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var RANDOM_GENE=RandomNumberGenerator.new()
	if RANDOM_GENE.randi_range(0,100)==0:
		var new_enemy=enemy_scene.instantiate()
		new_enemy.position=Vector2(
			RANDOM_GENE.randi_range(-2000/2,2000/2),
			RANDOM_GENE.randi_range(-2000/2,2000/2)
		)
		add_child(new_enemy)
