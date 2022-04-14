extends Spatial

var sand = preload("res://scenes/Sand.tscn")
var loading_blocks: bool = true
var added_blocks = []
const default_sand_position = Vector3(-1.897, 111.306, -10.729)

# Called when the node enters the scene tree for the first time.
func _ready():
	var iter = 0
	var offset = 2.009
	while iter < 10:
		var new_block = sand.instance()
		self.add_child(new_block)
		new_block.translate(Vector3(0, offset, 0))
		iter += 1
		offset += 2.009
		vr.log_info("added a block at position %s" % new_block.translation)
		added_blocks.append(new_block)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
