@tool
extends Sprite2D

class_name HandEquipt 

@onready var equipt_hitbox : Area2D = $Area2D

#by setting equippable item, which stems from resource, now only 
#equippable items can be used by this script instead of any resource
@export var equipped_item : EquipableItem :
	set(next_equipped):
		equipped_item = next_equipped
		self.texture = equipped_item.texture
		
@export var sprite_2d : Sprite2D
@onready var area_2d : Area2D = $Area2D

func _ready():
	if(not Engine.is_editor_hint()):
		area_2d.monitoring = false


func _on_area_2d_body_entered(body):
	if(not Engine.is_editor_hint()):
		if(equipped_item.has_method("interact_with_body")):
			equipped_item.interact_with_body(body)          
