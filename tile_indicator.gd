extends Sprite2D

@export var player: Player
@export var world: World

@onready var flash := $Flash

func _ready() -> void:
	texture = world.get_sprite(
		player.current_block.atlas_src,
		player.current_block.atlas_coords
	)

func _unhandled_input(event: InputEvent) -> void:
	if player.current_block != null:
		flash.play("flash")
		
		var mouse = get_global_mouse_position()
		var map = world.local_to_map(mouse)
		var final = world.map_to_local(map)
		
		global_position = final
