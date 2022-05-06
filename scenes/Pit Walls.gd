extends Spatial

const pitwall = preload("res://scenes/PitWall.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var new_wall = pitwall.instance()
	self.add_child(new_wall)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
