extends Control

func _ready() -> void:
	pass 
	
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/game.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
