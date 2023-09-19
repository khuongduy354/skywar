extends TextureRect
class_name UIItem
signal _set_active(item:Item)

@export var item_type:Global.item_type
var is_active =false
var real_item = null

func set_active(): 
	var item = Global.load_real_item(item_type) 
	if real_item: 
		item = real_item
	_set_active.emit(item)

func set_inactive(): 
	if real_item: 
		real_item.queue_free
