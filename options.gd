extends CanvasLayer

func _ready():
	$VolumeSlider.value_changed.connect(_on_volume_changed)
	$BackButton.pressed.connect(_on_back_pressed)
	
	# Cargar volumen guardado
	$VolumeSlider.value = AudioServer.get_bus_volume_db(0) * 10 + 100

func _on_volume_changed(value):
	# Convertir de 0-100 a decibelios (-80 a 0)
	var db = (value - 100) / 10.0
	AudioServer.set_bus_volume_db(0, db)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
