extends Area2D

var game_over_scene = preload("res://gameover.tscn")

func _on_body_entered(body):
	if body.name == "Player":
		var is_game_over = GameManager.lose_life()
		if is_game_over:
			body.queue_free()
			show_game_over()
		else:
			get_tree().reload_current_scene()

func show_game_over():
	var game_over = game_over_scene.instantiate()
	get_tree().root.add_child(game_over)
