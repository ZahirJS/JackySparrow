extends CanvasLayer

@export var level_number: int = 2
@export var next_level_path: String = "res://level2.tscn"

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	$LevelLabel.text = "NIVEL " + str(level_number)
	await get_tree().create_timer(2.5).timeout
	get_tree().change_scene_to_file(next_level_path)
	queue_free()  # Elimina esta escena después de cambiar
