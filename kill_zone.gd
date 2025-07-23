extends Area2D

@onready var timer: Timer = $Timer
@onready var d_sound = $AudioStreamPlayer2D
func _on_body_entered(body: Node2D) -> void:
	d_sound.play()
	print("You Died!")
	timer.start()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	
