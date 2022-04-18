extends Spatial

var sand = preload("res://scenes/Sand.tscn")
var loading_blocks: bool = true
var top_level_blocks = []
var added_blocks = []

func add_block(offset: Vector3, parent: Spatial = self):
	"""Adds a new sand block.
	
	Parameters
	----------
	offset : Vector3
	   	The offset used in translating the sand block. Note that it will not move it to this position,
		it will only add this offset to the current translation.
	parent : Spatial, optional
		The Spatial node to set the sand block
		
	Returns
	-------
	StaticBody
		The new instance of the sand block.
	"""
	var new_block = sand.instance()
	parent.add_child(new_block)
	new_block.translate(offset)
	return new_block

# Called when the node enters the scene tree for the first time.
func _ready():
	var iter = 0
	var offset = 0
	while iter < 10:
		var new_block = add_block(Vector3(0, offset, 0))
		iter += 1
		offset -= 2.0
		vr.log_info("added a block at position %s" % new_block.translation)
		added_blocks.append(new_block)
	loading_blocks = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
