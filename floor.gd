extends TileMapLayer



func _ready() -> void:
	var filled_tiles = get_used_cells()
	for tile in filled_tiles:
		var neighbouring = get_surrounding_cells(tile)
		for neighbour: Vector2i in neighbouring:
			if get_cell_source_id(neighbour) == -1:
				set_cell(neighbour, 1, Vector2i.ZERO)
			
