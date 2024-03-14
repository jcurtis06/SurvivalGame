# handles interactions with the tilemap
extends TileMap
class_name World

func _on_player_block_placed(position: Vector2, block: Block) -> void:
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

#func get_destructible_tile(map_coords: Vector2i) -> DestructibleTile:
	#var world_coords = map_to_local(map_coords)
	#
	#var atlas_coords = get_cell_atlas_coords(0, map_coords)
	#if atlas_coords < Vector2i.ZERO:
		#return null
	#
	#var atlas = tile_set.get_source(0) as TileSetAtlasSource
	#var atlas_img = atlas.texture.get_image() as Image
	#
	#var tile_img = atlas_img.get_region(atlas.get_tile_texture_region(atlas_coords))
	#var tile_texture = ImageTexture.create_from_image(tile_img)
	#
	#return DestructibleTile.new(tile_texture, world_coords, map_coords)
