extends Spatial

var sand = preload("res://scenes/Sand.tscn")
var loading_blocks: bool = true
var added_blocks = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var iter = 0
	var offset = 0
	vr.show_dbg_info("loading blocks", loading_blocks)
	while iter < 10:
		var new_block = sand.instance()
		self.add_child(new_block)
		new_block.translate(Vector3(0, offset, 0))
		iter += 1
		offset -= 2.0
		vr.log_info("added a block at position %s" % new_block.translation)
		added_blocks.append(new_block)
	loading_blocks = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
