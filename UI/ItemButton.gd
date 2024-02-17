@tool
extends Button

class_name ItemButton

@export var item : Item :
	set(item_to_slot):
		item = item_to_slot
		icon = item.texture
		
var hand_equipt : HandEquipt

func _ready():
	if(not Engine.is_editor_hint()):
		connect("pressed", _on_pressed)
	
func _on_pressed():
	if(not Engine.is_editor_hint()):
		if(item is EquipableItem):
			if(hand_equipt != null):
				hand_equipt.equipped_item = item



