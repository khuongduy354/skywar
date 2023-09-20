extends Node
enum item_type{
	GUN, 
	BOMB, 
	CONSUMABLE,
	MELEE_WEAPON
}
enum item_name{ 
	BOW,
	KNIFE
}
		
func load_real_item(_type: item_type,_name:item_name): 
	var scene =""
	match _type: 
		item_type.GUN: 
			match _name: 
				item_name.BOW: 
					scene = "res://Items/Gun/bow.tscn"
		item_type.MELEE_WEAPON: 
			match _name: 
				item_name.KNIFE: 
					scene = "res://Items/Melee/knife.tscn"
	var node = load(scene).instantiate()
	return node
