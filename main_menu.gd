extends CanvasLayer

func _ready():
	$PlayButton.pressed.connect(_on_play_pressed)
	$OptionsButton.pressed.connect(_on_options_pressed)
	$CreditsButton.pressed.connect(_on_credits_pressed)

func _on_play_pressed():
	GameManager.reset_game()
	get_tree().change_scene_to_file("res://level.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://options.tscn")

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://credits.tscn")
