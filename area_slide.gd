extends Area2D

@onready var player = $"../CharacterBody2D"

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		player.on_ice = true
	else:
		pass

func _on_area_exited(area: Area2D) -> void:
	player.on_ice = false
