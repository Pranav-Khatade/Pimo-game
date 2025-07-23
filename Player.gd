extends CharacterBody2D

var SPEED = 120.0
var JUMP_VELOCITY = -300.0
var key_counter = 0
var coin_counter = 0
var on_ice = false
var ICE_ACCEL = 200.0
var ICE_FRICTION = 100.0
var MAX_ICE_SPEED = 150.0

@onready var _animated_sprite = $AnimatedSprite2D
@onready var door = $"../Door"
@onready var bottle = $"../bottle"
@onready var coin_label =%Label

func _process(_delta):
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("KEY_D"):
		_animated_sprite.play("run")
	elif Input.is_action_pressed("ui_left") or Input.is_action_pressed("KEY_A"):
		_animated_sprite.play("back") 
	else:
		_animated_sprite.play("idle")
   
func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		_animated_sprite.play("Jump_f")

	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

	var direction := Input.get_axis("move_left", "move_right")
	if on_ice:
		if direction != 0:
			velocity.x += direction * ICE_ACCEL * delta
			velocity.x = clamp(velocity.x, -MAX_ICE_SPEED, MAX_ICE_SPEED)
		else:
			velocity.x = move_toward(velocity.x, 0, ICE_FRICTION * delta)
	else:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func set_coin(new_coin_count: int) -> void:
	coin_counter=new_coin_count
	coin_label.text = "Coin :" + str(coin_counter)
	print(coin_counter)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("coin"):
		set_coin(coin_counter +1)
	elif area.is_in_group("key"):
		set_key(key_counter +1)

func set_key(new_kcount: int) -> void:
	key_counter=new_kcount
	print(key_counter)

func teleport_1():
	if door.going_counter==1:
		print("teleport")
		await get_tree().create_timer(0.5).timeout
		position = Vector2(3574.666,-34)
		

func speed_bottle():
	print("Entered Function")
	SPEED = SPEED - 50
	if SPEED == 70:
		await get_tree().create_timer(5).timeout
		SPEED =120
	
func garvity_bottle():
	print("gravity is set to -200")
	JUMP_VELOCITY = -400
	if JUMP_VELOCITY == -400:
		await get_tree().create_timer(10).timeout
		JUMP_VELOCITY=-300

func death_anime():
	print("death is sudden")
	_animated_sprite.play("death")

func teleport_2():
	GlobalData.key_counter = key_counter
	GlobalData.coin_counter = coin_counter
	print("teleport")
	await get_tree().create_timer(0.5).timeout
	position = Vector2(6438.523,-100)

func teleport_3():
	GlobalData.key_counter = key_counter
	GlobalData.coin_counter = coin_counter
	get_tree().change_scene_to_file("res://scene/escape.tscn")
