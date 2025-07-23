extends Area2D

@onready var key_sound = $AudioStreamPlayer2D
@onready var collision_shape = $CollisionShape2D
@onready var sprite = $Sprite2D

var triggered = false

func _on_area_entered(area: Area2D) -> void:
	if triggered:
		return

	if area.is_in_group("player"):
		triggered = true
		sprite.visible = false
		collision_shape.set_deferred("disabled", true)
		key_sound.play()
		

func _on_audio_stream_player_2d_finished() -> void:
	queue_free()
