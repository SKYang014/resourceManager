extends Node2D

@onready var equipt_hitbox : Area2D = $Area2D

@export var equipt_item : Resource

func _on_area_2d_body_entered(body):
	if(body is ResourceNode):
		body.harvest()
