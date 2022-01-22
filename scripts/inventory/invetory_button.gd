extends Button





func _on_invetory_button_pressed():
	Inventory.item_effect(int(name))
