extends Control

func _ready():
	var item = Node2D.new()
	add_child(item)
	item.global_position = Vector2(30,30)
