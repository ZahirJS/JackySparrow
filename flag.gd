extends Area2D

var victory_scene = preload("res://victory.tscn")

func _on_body_entered(body):
	if body.name == "Player":
		show_victory()

func show_victory():
	var victory = victory_scene.instantiate()
	get_tree().root.add_child(victory)
