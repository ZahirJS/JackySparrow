extends CanvasLayer

@onready var coin_label = $CoinLabel
@onready var lives_label = $LivesLabel

func _process(delta):
	coin_label.text = "Monedas: " + str(GameManager.coins)
	lives_label.text = "Vidas: " + str(GameManager.lives)
