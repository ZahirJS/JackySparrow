extends CanvasLayer

func _ready():
	get_tree().paused = true

func _on_button_pressed():
	get_tree().paused = false
	GameManager.reset_game()
	get_tree().change_scene_to_file("res://level.tscn")
