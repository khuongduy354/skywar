extends Control
class_name Hotbar
@onready var itemcontainers = $HBoxContainer
var active_idx = 0: set = set_active

signal out_hotbar(item:UIItem)


func set_active(val): 
	active_idx = val
	_on_pressed(itemcontainers.get_child(active_idx))


func _ready():
	for button in itemcontainers.get_children(): 
#		if buttons.get_child_count() > 0: 
		button.connect("pressed",Callable(self,"_on_pressed").bind(button))

func load_from_inventory(item:UIItem): 
	for button in itemcontainers.get_children(): 
		# remove current slot 
		if button.get_child_count() > 0: 
			var current_item = button.get_child(0)
			out_hotbar.emit(current_item)
			current_item.set_inactive() 
			button.remove_child(current_item)
		
		# load item to current active hotbar slot 
		if active_idx == button.get_index(): 
			var hotbar_item:UIItem =item.duplicate()
#			var hotbar_item = ColorRect.new()
			hotbar_item.set_anchors_preset(Control.PRESET_CENTER)
			button.add_child(hotbar_item)
			hotbar_item.set_active()

func _on_pressed(button:Button): 
	# pressed button activated 
	if button.get_child_count() > 0: 
		active_idx=button.get_index()
		var ui_item:UIItem = button.get_child(0)
		ui_item.set_active()

	# deactivated all other buttons 
	for other_button in itemcontainers.get_children(): 
		if other_button !=button and other_button.get_child_count() > 0: 
			var remove_item = other_button.get_child(0)
			remove_item.set_inactive()
			out_hotbar.emit(remove_item)

