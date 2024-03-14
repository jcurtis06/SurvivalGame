extends CanvasLayer

@export var player_inventory: Inventory

@onready var hotbar := $Hotbar
@onready var hotbar_slots := $Hotbar/BG/GridContainer.get_children()

func _ready() -> void:
	update_slots()

func update_slots() -> void:
	for i in range(min(player_inventory.items.size(), hotbar_slots.size())):
		hotbar_slots[i].update(player_inventory.items[i])

func _on_player_inventory_toggled(open: bool) -> void:
	pass
	#inventory.visible = open
