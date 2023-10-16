extends CharacterBody2D

@onready var _enemy_animation=$AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	_enemy_animation.play()
	pass # Replace with function body.

@onready var _player:CharacterBody2D=$"../../Player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	const ENEMY_SPEED=50
	
	var _player_position=_player.position
	var _base_vector=_player_position-position
	#ある程度プレイヤーに近くなったら、止まる
	if sqrt(_base_vector.x**2+_base_vector.y**2)>500:
		#離れている
		velocity=_base_vector.normalized()*ENEMY_SPEED
	elif sqrt(_base_vector.x**2+_base_vector.y**2)<400:
		#近すぎる
		print("leave")
		velocity=-(_base_vector.normalized()*ENEMY_SPEED)
	else:
		#ちょうどいい位置
		velocity=Vector2(0,0)
	move_and_slide()
	pass
