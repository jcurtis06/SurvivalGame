# handles interactions with the tilemap
extends TileMap
class_name World

func _on_player_block_placed(position: Vector2, block: Block) -> void:
	if block is SceneBlock:
		var scene = block.scene.instantiate()
		
		var mouse = get_global_mouse_position()
		var map = local_to_map(mouse)
		var final = map_to_local(map)
		
		scene.global_position = final
		add_child(scene)
		scene.place()
	else:
		var map_pos = local_to_map(position)
		set_cell(1, map_pos, block.atlas_src, block.atlas_coords)

func _on_player_block_destroyed(position: Vector2) -> void:
	var map_pos = local_to_map(position)
	set_cell(1, map_pos)

func get_sprite(src: int, coords: Vector2i) -> ImageTexture:
	var atlas = tile_set.get_source(src) as TileSetAtlasSource
	var atlas_img = atlas.texture.get_image() as Image
	var tile_img = atlas_img.get_region(atlas.get_tile_texture_region(coords))
	
	return ImageTexture.create_from_image(tile_img)
