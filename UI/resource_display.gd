extends MarginContainer

@export var item_display_template : PackedScene
@onready var grid_container : GridContainer = $GridContainer

var displays : Array[ResourceItemDisplay]
var player_inventory : Inventory


#get tree is the main level or current scene for the game
func _ready():
	var player : Player = get_tree().get_first_node_in_group("player")
	player_inventory = player.find_child("Inventory") as Inventory
	#we set the player class and put player into a group so when it emits a change, this display is listening
	# and runs what it needs to to update ui
	player_inventory.connect("resource_count_changed", _on_player_inventory_resource_count_changed)


func _on_player_inventory_resource_count_changed(type : ResourceItem, new_count : int) -> void:
	#find exsisting item display based on resource type and update the count
	var current_display : ResourceItemDisplay
	
	for display in displays:
		if(display.resource_type == type):
			current_display = display
			current_display.update_count(new_count)
			print("old item")
			break
	
	#if none, create new display, set the resource type and updated the count
	if(current_display == null):
		var new_display : ResourceItemDisplay = item_display_template.instantiate() as ResourceItemDisplay
		grid_container.add_child(new_display)
		new_display.resource_type = type
		new_display.update_count(new_count)
		displays.append(new_display)
		print("new item")
	
