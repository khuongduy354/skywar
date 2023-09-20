extends CharacterBody2D
class_name Player

@export var speed = 400 
func _ready(): 
	Events.connect("active_item",Callable(self,"_on_active_item"))
	Events.connect("inactive_item",Callable(self,"_on_inactive_item"))
	
func _on_inactive_item(item:Item):
	remove_child(item)
func _on_active_item(item:Item): 
	add_child(item)
func get_input(): 
	var dir =Vector2.ZERO 
	dir.y =  Input.get_axis("ui_up", "ui_down")
	dir.x = Input.get_axis("ui_left","ui_right")
	return dir

func _physics_process(delta):
	look_at(get_global_mouse_position())
	var dir =get_input()
	velocity = dir * speed
	move_and_slide()
