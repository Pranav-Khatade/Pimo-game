extends CharacterBody2D


@onready var _animated_sprite = $AnimatedSprite2D
func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		_animated_sprite.play("back")
	else:
		_animated_sprite.play("idle")
   


const SPEED = 120.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
