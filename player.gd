extends CharacterBody2D

const SPEED = 600.0
const JUMP_VELOCITY = -900.0
const FALL_GRAVITY_MULTIPLIER = 5.5

var jumps_remaining = 2

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Gravedad
	if not is_on_floor():
		if velocity.y > 0:
			velocity += get_gravity() * delta * FALL_GRAVITY_MULTIPLIER
		else:
			velocity += get_gravity() * delta * 1.5
	else:
		jumps_remaining = 2
	
	# Salto
	if Input.is_action_just_pressed("ui_accept") and jumps_remaining > 0:
		velocity.y = JUMP_VELOCITY
		jumps_remaining -= 1
	
	# Movimiento con flechas
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction != 0:
		velocity.x = direction * SPEED
		animated_sprite.flip_h = (direction < 0)
		animated_sprite.play("run")
	else:
		velocity.x = 0
		animated_sprite.play("idle")
	
	move_and_slide()

func take_damage():
	animated_sprite.modulate = Color(1, 0, 0)
	await get_tree().create_timer(0.2).timeout
	animated_sprite.modulate = Color(1, 1, 1)
