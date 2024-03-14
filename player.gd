# the player
extends CharacterBody2D
class_name Player

signal block_placed(position: Vector2, block: Block)
signal block_destroyed(position: Vector2)

@export var speed = 50.0

@export var current_block: Block

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
	
	if velocity == Vector2.ZERO:
		sprite.play("idle")
	else:
		sprite.play("walk_right")
	
	move_and_slide()
