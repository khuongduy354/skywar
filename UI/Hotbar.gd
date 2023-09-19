extends Control
class_name Hotbar
@onready var itemcontainers = $HBoxContainer

func _ready():
	for button in itemcontainers.get_children(): 
#		if buttons.get_child_count() > 0: 
		button.connect("pressed",Callable(self,"_on_pressed").bind(button))

func load_from_inventory(item:UIItem): 
	pass 


func _on_pressed(button:Button): 
	# pressed button activated 
	if button.get_child_count() > 0: 
		var ui_item:UIItem = button.get_child(0)
		ui_item.set_active()

	# deactivated all other buttons 
	for other_button in itemcontainers.get_children(): 
		if other_button !=button and other_button.get_child_count() > 0: 
			other_button.get_child(0).set_inactive()

