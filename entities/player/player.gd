# the player
extends CharacterBody2D
class_name Player

signal block_placed(position: Vector2, block: Block)
signal block_destroyed(position: Vector2)
signal hand_changed(new: InvItem, old: InvItem)

signal inventory_toggled(open: bool)

@export var speed = 50.0

@export var inventory: Inventory
@export var current_item: InvItem

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var inventory_open = false

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

func _process(delta: float) -> void:
	_manage_hotbar_slot()
	
	if Input.is_action_just_pressed("open_inventory"):
		inventory_open = !inventory_open
		current_item = null
		inventory_toggled.emit(inventory_open)

func _manage_hotbar_slot() -> void:
	var prev_item = current_item
	
	if Input.is_action_just_pressed("slot_1"):
		current_item = inventory.items[0]
	if Input.is_action_just_pressed("slot_2"):
		current_item = inventory.items[1]
	if Input.is_action_just_pressed("slot_3"):
		current_item = inventory.items[2]
	if Input.is_action_just_pressed("slot_4"):
		current_item = inventory.items[3]
	if Input.is_action_just_pressed("slot_5"):
		current_item = inventory.items[4]
	if Input.is_action_just_pressed("slot_6"):
		current_item = inventory.items[5]
	if Input.is_action_just_pressed("slot_7"):
		current_item = inventory.items[6]
	if Input.is_action_just_pressed("slot_8"):
		current_item = inventory.items[7]
	if Input.is_action_just_pressed("slot_9"):
		current_item = inventory.items[8]
	
	if prev_item != current_item:
		hand_changed.emit(current_item, prev_item)
