extends Node

var coins = 0
var lives = 3

func add_coin():
	coins += 1

func reset_coins():
	coins = 0

func lose_life():
	lives -= 1
	if lives < 0:
		lives = 0
	print("Vidas restantes: ", lives)
	return lives <= 0

func reset_lives():
	lives = 3

func reset_game():
	coins = 0
	lives = 3
