extends VBoxContainer
class_name Slot
var item:UIItem = null
signal equip_item(ui_item)


func _ready(): 
	for child in get_children(): 
		if child is UIItem: 
			item = child

func _on_button_pressed():
	equip_item.emit(item)
