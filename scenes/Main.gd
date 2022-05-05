extends Spatial

func _ready():
	vr.initialize()
	pass

func _physics_process(_dt):
	if (vr.button_just_pressed(vr.BUTTON.ENTER)): # reload game
		vr.switch_scene("res://Main.tscn");
