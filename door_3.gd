extends Area2D

@onready var player = $"../CharacterBody2D"
@onready var anime = $AnimatedSprite2D
@onready var door3_sound = $AudioStreamPlayer2D
var go_counter = 0
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player") and go_counter == 0:
		anime.play("door_anim")
		door3_sound.play()
		await get_tree().create_timer(1).timeout
		player.teleport_3()
		go_counter =1
	elif area.is_in_group("player") and go_counter == 1:
		door3_sound.play()
		player.teleport_3()
		
