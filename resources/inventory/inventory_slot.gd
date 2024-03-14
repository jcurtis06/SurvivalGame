extends ColorRect
class_name InventorySlot

@onready var display := $ItemDisplay

func update(item: InvItem) -> void:
	if !item:
		display.visible = false
	else:
		display.visible = true
		display.texture = item.texture
