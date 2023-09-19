extends GridContainer
signal equip_item(ui_item:UIItem)

func _ready(): 
	for inv_slot in get_children():
		inv_slot.connect("equip_item",Callable(self,"_equip_item"))

# bubbling up 
func _equip_item(item:UIItem): 
	equip_item.emit(item)
