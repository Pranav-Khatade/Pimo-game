extends CharacterBody2D
@onready var sprite = $Sprite2D

func _ready() -> void:
	sprite.visible = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	sprite.visible = true
