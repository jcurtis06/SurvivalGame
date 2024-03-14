extends Sprite2D

@export var player: Player
@export var world: World

@onready var flash := $Flash
@onready var scene_container := $SceneContainer

func _process(delta: float) -> void:
	if visible:
		var mouse = get_global_mouse_position()
		var map = world.local_to_map(mouse)
		var final = world.map_to_local(map)
		
		global_position = final

func _on_player_hand_changed(new: InvItem, old: InvItem) -> void:
	if new == null:
		visible = false
		return
	
	if old != null && old.block != null:
		if old.block is SceneBlock:
			for n in scene_container.get_children():
				n.queue_free()
	
	if new.block != null:
		visible = true
		flash.play("flash")
		
		if new.block is SceneBlock:
			texture = null
			var block = new.block as SceneBlock
			scene_container.add_child(block.scene.instantiate())
		else:
			texture = world.get_sprite(
				new.block.atlas_src,
				new.block.atlas_coords
			)
	else:
		visible = false
