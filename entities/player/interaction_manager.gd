# handles building & breaking
extends Node2D
class_name InteractionManager

@onready var player: Player = get_parent()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if player.current_block != null:
			_build()
	if Input.is_action_just_pressed("destroy"):
		_destroy()

func _build() -> void:
	var pos = get_global_mouse_position()
	player.block_placed.emit(pos, player.current_block)

func _destroy() -> void:
	var pos = get_global_mouse_position()
	player.block_destroyed.emit(pos)
