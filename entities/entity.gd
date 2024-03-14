extends CharacterBody2D
class_name Entity

@export var health: int

func take_damage(amount: int):
	health -= amount
	
	if health <= 0:
		queue_free()
