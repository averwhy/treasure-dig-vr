extends Area

class_name OQClass_GrabbableToolPart

var parent_tool = null
var motion_controller = null

var _hand_slipped = false

func grab_init(controller):
	_hand_slipped = false
	parent_tool.grab_with_controller(controller, self)

func grab_release(controller):
	if motion_controller != null:
		motion_controller.process_release(self)
	parent_tool.release(controller)
	
func is_grabbed():
	return parent_tool.is_part_grabbed(self)

func did_hand_slip():
	return _hand_slipped

func notify_hand_slipped():
	_hand_slipped = true

func get_grab_transform():
	return null

func pose_part(start_grab_pos: Vector3, new_grab_pos: Vector3):
	if motion_controller != null:
		motion_controller.pose_part(start_grab_pos, new_grab_pos)

func _ready():
	for child in get_children():
		if child is OQClass_ToolGrabController:
			motion_controller = child

var sand_collision_count = {}
var sand_integrity = 5
var random = RandomNumberGenerator.new()
const sand_sounds = [
	preload("res://sounds/sand1.ogg"),
	preload("res://sounds/sand2.ogg"),
	preload("res://sounds/sand3.ogg"),
	preload("res://sounds/sand4.ogg"),
	preload("res://sounds/sand5.ogg"),
]

#func random_sand_sound(body):
#	random.randomize()
#	var sound: AudioStreamOGGVorbis = sand_sounds[random.randi_range(0,4)]
#	var stream = body.get_child(2)
#	stream.stream = sound
#	stream.play()

func _on_ShovelArea_body_exited(body): # Here we detect when it collides with a sand block
	if not ("Sand" in body.name):
		return # Ignore all other staticbodys since we only want sand
	if sand_collision_count.has(body.name):
		var current_count = sand_collision_count.get(body.name)
		var new_count = current_count - 1
		sand_collision_count[body.name] = new_count
		if new_count == 0:
			# Destroy block!
			body.queue_free() # queue's node for deletion at end of current frame
			player.add_money(2) # add money to players balance
			
	else:
		# adds that sand block to the dictionary with the default integrity
		sand_collision_count[body.name] = sand_integrity
