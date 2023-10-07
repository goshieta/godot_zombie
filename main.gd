extends Node2D

#ワールドの範囲は 2000*2000
const WORLD_SIZE=Vector2(2000,2000)

@onready var _camera=$Camera2D
@onready var _player=$Player

const SPEED=2

@onready var screen=get_viewport_rect()
var grass_scene=load("res://src/grass.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(20):
		var rnd=RandomNumberGenerator.new()
		rnd.randomize()
		var grass=grass_scene.instantiate()
		grass.position=Vector2(
			rnd.randi_range(-WORLD_SIZE.x/2,WORLD_SIZE.x/2),
			rnd.randi_range(-WORLD_SIZE.y/2,WORLD_SIZE.y/2)
		)
		add_child(grass)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	const MOVE_SPEED=200
	
	#プレイヤー移動
	if Input.is_action_pressed("ui_left"):
		_player.velocity=Vector2(-MOVE_SPEED,0)
		_player.move_and_slide()
	if Input.is_action_pressed("ui_right"):
		_player.velocity=Vector2(MOVE_SPEED,0)
		_player.move_and_slide() 
	if Input.is_action_pressed("ui_up"):
		_player.velocity=Vector2(0,-MOVE_SPEED)
		_player.move_and_slide()
	if Input.is_action_pressed("ui_down"):
		_player.velocity=Vector2(0,MOVE_SPEED)
		_player.move_and_slide()
	
	_camera.position=_player.position
		
