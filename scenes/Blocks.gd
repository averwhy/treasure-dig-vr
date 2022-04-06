extends Spatial

var loading_blocks: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	var children: Array = self.get_children()
	for b in children:
		print("%s" % b.name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
