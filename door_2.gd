extends Area2D

@onready var transdoor = $transdoor
@onready var player = $"../CharacterBody2D"
@onready var door2_label = $"../door_label2"
@onready var door2_sound = $AudioStreamPlayer2D
var going_count =0

func _ready() -> void:
	door2_label.visible = false
	transdoor.visible = false

func _process(delta: float) -> void:
	if player.key_counter ==2:
		transdoor.visible = true

func _on_area_entered(area: Area2D) -> void:
	print("entered door 2 ")
	if player.key_counter >= 2 and player.is_in_group("player"):
		door2_sound.play()
		transdoor.play("door_anime_2")
		going_count += 1
		transdoor.animation_finished
		player.teleport_2()
		print("teleport22")
		print(player.key_counter)
	elif player.key_counter ==1 or 0:
		door2_label.visible=true
	else:
		pass

func _on_transdoor_animation_finished() -> void:
	print("teleport2")
	if player.key_counter >= 2:
		door2_sound.play()
		player.teleport_2()

func _on_area_exited(area: Area2D) -> void:
	transdoor.animation_finished
