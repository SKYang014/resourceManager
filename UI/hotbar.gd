extends Control

@onready var player : Player = get_tree().get_first_node_in_group("player")
var hand_equipt : HandEquipt

@onready var grid_container : GridContainer = $GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	if(player):
		hand_equipt = player.find_child("HandEquipt")
		
		for button in grid_container.get_children():
			if(button is ItemButton):
				button.hand_equipt = hand_equipt
