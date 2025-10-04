extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		body.take_damage()
		var is_game_over = GameManager.lose_life()
		if is_game_over:
			get_tree().reload_current_scene()
