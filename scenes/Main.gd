extends Spatial

const default_player_origin = Vector3(0, 113.954, 0.001)
const default_shovel_origin = Vector3(0, 113, -2.8)

func _ready():
	vr.initialize()
	pass

func _physics_process(_dt):
	if (vr.button_just_pressed(vr.BUTTON.ENTER)): # teleport player to spawn
		vr.switch_scene("res://Main.tscn"); # adds fade effect
		var player = self.get_node("OQ_ARVROrigin")
		var shovel = self.get_node("Shovel")
		player.transform.origin = default_player_origin # does the actual teleporting
		
		#doesnt work \/ \/
		shovel.transform.origin = default_shovel_origin
