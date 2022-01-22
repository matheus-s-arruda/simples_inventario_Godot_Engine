extends HBoxContainer

const inv_button = preload("res://scenes/inventory/invetory_button.tscn")


export(Vector2) var button_min_size := Vector2(64, 64)


func _ready():
	var err = Inventory.connect("update_itens", self, "_inventory_update")


func _inventory_update(itens: Dictionary):
	var check_list = itens.duplicate()
	
	for child in get_children():
		var item_index = int(child.name)
		if check_list.has(item_index):
			if check_list[item_index][Inventory.TYPE] == Inventory.POTION:
				child.get_node("quantity").text = String(check_list[item_index][Inventory.OWN])
			check_list.erase(item_index)
		else:
			child.queue_free()
	
	for _item in check_list:
		var item_btn = inv_button.instance()
		item_btn.name = String(_item)
		item_btn.icon = load(itens[_item][Inventory.IMAGE])
		item_btn.hint_tooltip = itens[_item][Inventory.DESCRIPTION]
		
		if itens[_item][Inventory.TYPE] == Inventory.POTION:
			item_btn.get_node("quantity").text = String(itens[_item][Inventory.OWN])
		
		item_btn.expand_icon = true
		item_btn.rect_min_size = button_min_size
		add_child(item_btn)

