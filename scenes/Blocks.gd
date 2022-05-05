extends Spatial

const enabled = true
const sand = preload("res://scenes/Sand.tscn")

var loading_blocks: bool = true
var top_level_offsets = []
var top_level_blocks = []
var added_blocks = []

# config
var amount = 40

func add_block(offset: Vector3, parent: Spatial = self):
	var new_block = sand.instance()
	parent.add_child(new_block)
	new_block.translate(offset)
	return new_block

# Called when the node enters the scene tree for the first time.
func _ready():
	if not enabled: return
	
	top_level_offsets = [
		Vector3(0, 0, 0),
		Vector3(0, 0, -2),
		Vector3(0, 0, -4),
		Vector3(2, 0, 0),
		Vector3(2, 0, -2),
		Vector3(2, 0, -4),
		Vector3(4, 0, 0),
		Vector3(4, 0, -2),
		Vector3(4, 0, -4)
	]
	for offset in top_level_offsets:
		top_level_blocks.append(
			add_block(offset)
		)
	
	var iter = 0;
	for block in top_level_blocks:
		var offset = -2.0
		var block_vector = top_level_offsets[iter]
		for _i in range(amount):
			var vector_offset = block_vector
			vector_offset.y = block_vector.y + offset
			added_blocks.append(
				add_block(vector_offset)
			)
			offset -= 2.0
		iter += 1
	loading_blocks = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
