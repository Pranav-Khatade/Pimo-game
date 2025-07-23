extends Area2D

@onready var player = $"../CharacterBody2D"
@onready var b_label = $b_label

func _ready() -> void:
	b_label.visible = false

func _on_area_entered(area: Area2D) -> void:
	print("entered bottle")
	b_label.visible = true
	if area.is_in_group("player"):
		print("bottle picked")
		player.speed_bottle()
		queue_free()
