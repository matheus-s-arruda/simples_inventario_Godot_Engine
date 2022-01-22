extends Control



func _on_heal_potion_pressed():
	Inventory.add_item(Inventory.ItemName.HEALING_POTION, 1)


func _on_magic_potion_pressed():
	Inventory.add_item(Inventory.ItemName.MAGIC_POTION, 1)


func _on_key_pressed():
	Inventory.add_item(Inventory.ItemName.PORTAL_KEY, 1)


func _on_sword_pressed():
	Inventory.add_item(Inventory.ItemName.MAGIC_SWORD, 1)


func _on_bow_pressed():
	Inventory.add_item(Inventory.ItemName.BOW_AND_ARROW, 1)


func _on_wand_pressed():
	Inventory.add_item(Inventory.ItemName.MAGIC_WAND, 1)


func _on_remove_heal_potion_pressed():
	Inventory.remove_item(Inventory.ItemName.HEALING_POTION, 1)


func _on_remove_magic_potion_pressed():
	Inventory.remove_item(Inventory.ItemName.MAGIC_POTION, 1)


func _on_remove_key_pressed():
	Inventory.remove_item(Inventory.ItemName.PORTAL_KEY, 1)


func _on_remove_sword_pressed():
	Inventory.remove_item(Inventory.ItemName.MAGIC_SWORD, 1)


func _on_remove_bow_pressed():
	Inventory.remove_item(Inventory.ItemName.BOW_AND_ARROW, 1)


func _on_remove_wand_pressed():
	Inventory.remove_item(Inventory.ItemName.MAGIC_WAND, 1)


