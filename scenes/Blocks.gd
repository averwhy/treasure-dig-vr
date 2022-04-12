extends Spatial

var loading_blocks: bool = true
var added_blocks = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var children: Array = self.get_children()
	var iter = 0
	var offset = 2.009
	while iter < 10:
		for block in children:
			vr.show_dbg_info("blocks","running, iter %s" % iter)
			var new_block = self.duplicate(4)
			new_block.translate(Vector3(block.translation.x, (block.translation.y + offset), block.translation.z))
		iter += 1
		offset += 2.009
	vr.show_dbg_info("blocks", "stopped")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
