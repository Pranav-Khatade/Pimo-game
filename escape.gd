extends Control

@onready var coin = $VBoxContainer/coin
@onready var key = $VBoxContainer/keys
@onready var pannel = %Panel
func _ready() -> void:
	coin.text = "Total Coin Collected : " + str(GlobalData.coin_counter)
	key.text = "Total Keys Collected : " + str(GlobalData.key_counter)

func _process(delta: float) -> void:
	pass

func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/credit.tscn")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Main.tscn")
