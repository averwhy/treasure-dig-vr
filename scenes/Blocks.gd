extends Spatial

const sand = preload("res://scenes/Sand.tscn")
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
		The Spatial node to set the sand block. Defaults to `self`.
		
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
	top_level_blocks = [
		add_block(Vector3(0, 0, 0)),
		add_block(Vector3(0, 0, -2)),
		add_block(Vector3(0, 0, -4)),
		add_block(Vector3(2, 0, 0)),
		add_block(Vector3(4, 0, 0)),
		add_block(Vector3(2, 0, -2)),
		add_block(Vector3(4, 0, -4)),
		add_block(Vector3(4, 0, -2)),
		add_block(Vector3(2, 0, -4))
	]
	
	var iter = 0
	var offset = -2.0
	for block in top_level_blocks:
		vr.show_dbg_info("blockpos", "%s" % block.translation.y + offset)
		var new_block = add_block((block.translation.y + offset))
		added_blocks.append(new_block)
	loading_blocks = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
