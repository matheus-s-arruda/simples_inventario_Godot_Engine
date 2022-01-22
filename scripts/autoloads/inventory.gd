extends Node

signal update_itens(itens)

enum {TYPE, IMAGE, DESCRIPTION, OWN}
enum {POTION, KEY, WEAPON}
enum ItemName {
	MAGIC_POTION,
	HEALING_POTION,
	PORTAL_KEY,
	MAGIC_WAND,
	MAGIC_SWORD,
	BOW_AND_ARROW,
	}

const ITEM_LIST := {
	ItemName.MAGIC_POTION : {TYPE: POTION, IMAGE:"res://assets/img/mana.png" , DESCRIPTION:"restore mana" },
	ItemName.HEALING_POTION : {TYPE: POTION, IMAGE: "res://assets/img/heal.png", DESCRIPTION:"recover life" },
	ItemName.PORTAL_KEY : {TYPE: KEY, IMAGE: "res://assets/img/key.png", DESCRIPTION:"Can be used to open a portal" },
	ItemName.MAGIC_WAND : {TYPE: WEAPON, IMAGE: "res://assets/img/wand.png", DESCRIPTION:"A powerful magic wand" },
	ItemName.MAGIC_SWORD : {TYPE: WEAPON, IMAGE: "res://assets/img/sword.png", DESCRIPTION:"A very sharp magic sword" },
	ItemName.BOW_AND_ARROW : {TYPE: WEAPON, IMAGE: "res://assets/img/bow.png", DESCRIPTION:"A bow with mighty arrows" },
}

var itens := {}

#Chame essa função para adicionar itens
func add_item(item_id: int, quantity: int):
	if itens.has(item_id):
		if itens[item_id][TYPE] != POTION:
			return
		itens[item_id][OWN] += quantity
	
	else:
		var new_item = ITEM_LIST[item_id].duplicate()
		if new_item[TYPE] == POTION:
			new_item[OWN] = 1
		else:
			new_item[OWN] = quantity
			
		itens[item_id] = new_item
	emit_signal("update_itens", itens)


#Chame essa função para remover itens no iventario
func remove_item(item_id: int, quantity: int):
	if itens.has(item_id):
		if itens[item_id][TYPE] == POTION:
			itens[item_id][OWN] -= quantity
			if itens[item_id][OWN] <= 0:
				var err = itens.erase(item_id)
		else:
			var err = itens.erase(item_id)
		emit_signal("update_itens", itens)


func item_effect(item_id):
	match item_id:
		ItemName.HEALING_POTION:
			print("Your life has been regenerated!")
			remove_item(ItemName.HEALING_POTION, 1)
			
		ItemName.MAGIC_POTION:
			print("your mana has been restored!")
			remove_item(ItemName.MAGIC_POTION, 1)
			
		ItemName.MAGIC_SWORD:
			print("armed himself with a sword")
			
		ItemName.BOW_AND_ARROW:
			print("armed with bow")
			
		ItemName.MAGIC_WAND:
			print("armed with wand")
		
		#ItemName.PORTAL_KEY: # esse item não possui efeito, portanto, não é nescessario colocar aqui


