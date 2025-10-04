extends Area2D

@export var next_level_path: String = ""
@export var next_level_number: int = 2

var victory_scene = preload("res://victory.tscn")
var transition_scene = preload("res://level_transition.tscn")

func _on_body_entered(body):
	if body.name == "Player":
		complete_level()

func complete_level():
	if next_level_path == "":
		show_victory()
	else:
		show_transition()

func show_transition():
	var transition = transition_scene.instantiate()
	transition.level_number = next_level_number
	transition.next_level_path = next_level_path
	get_tree().root.add_child(transition)
	get_tree().current_scene.queue_free()

func show_victory():
	get_tree().paused = true
	var victory = victory_scene.instantiate()
	get_tree().root.add_child(victory)
