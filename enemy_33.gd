extends CharacterBody2D

const SPEED = 100.0
const PATROL_RANGE = 100.0

var direction = 1
var start_position = Vector2.ZERO
var distance_traveled = 0.0

@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	animated_sprite.play("walk")
	start_position = global_position

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	velocity.x = direction * SPEED
	distance_traveled = abs(global_position.x - start_position.x)
	
	if distance_traveled >= PATROL_RANGE:
		direction *= -1
		animated_sprite.flip_h = !animated_sprite.flip_h
		start_position = global_position
	
	move_and_slide()

func _on_hit_box_body_entered(body):
	if body.name == "Player":
		if body.velocity.y > 0 and body.global_position.y < global_position.y - 20:
			print("¡Enemigo eliminado!")
			queue_free()
			body.velocity.y = -300
		else:
			body.take_damage()
			var is_game_over = GameManager.lose_life()
			if is_game_over:
				get_tree().reload_current_scene()
