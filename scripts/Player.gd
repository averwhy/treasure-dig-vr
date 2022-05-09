extends Node

var money = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_money(amount: int):
	money += amount
	
func remove_money(amount: int):
	money -= amount
	
func set_money(amount: int):
	money = amount

func update_screen_balance():
	vr.show_dbg_info("Money", "$%s" % money)

var last_iter = null;
func _process(delta):
	if last_iter == null:
		update_screen_balance()
		last_iter = money
		return
	if money == last_iter:
		return
	if money != last_iter:
		update_screen_balance()
