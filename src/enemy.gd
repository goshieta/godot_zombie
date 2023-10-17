extends CharacterBody2D

@onready var _enemy_animation=$AnimatedSprite2D

signal enemy_attack(first_position:Vector2,dir_vector:Vector2)

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
		velocity=-(_base_vector.normalized()*ENEMY_SPEED)
	else:
		#ちょうどいい位置
		velocity=Vector2(0,0)
		var rnd=RandomNumberGenerator.new()
		if rnd.randi_range(0,100)==0: _attack()
	move_and_slide()
	pass

func _attack():
	var dir_vec=(_player.position-position).normalized()
	enemy_attack.emit(position,dir_vec)
	pass
