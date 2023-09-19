extends Node
enum item_type{
	GUN, 
	BOMB, 
	CONSUMABLE,
	MELEE_WEAPON
}

func load_real_item(_type: item_type): 
	var scene =""
	match _type: 
		item_type.GUN: 
			scene = ""
