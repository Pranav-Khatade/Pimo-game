extends Area2D

@onready var hint_lvl_2 = $"../clint_2"
@onready var hint_lvl_2_2 = $"../clint_3"
@onready var player = $"../CharacterBody2D"

func _ready() -> void:
	hint_lvl_2.visible = false
	hint_lvl_2_2.visible = false

func _on_area_entered(area: Area2D) -> void:
	if player.key_counter > 0:
		hint_lvl_2.visible = true
	else:
		hint_lvl_2_2.visible = true

func _on_area_exited(area: Area2D) -> void:
	hint_lvl_2.visible = false
	hint_lvl_2_2.visible = false
