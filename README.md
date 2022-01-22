# simples_inventario_Godot_Engine
 inventario de poucos itens feito na Godot Engine

![](https://github.com/matheus-s-arruda/simples_inventario_Godot_Engine/blob/main/assets/img/img1.png)

#### Descrição
O sistema de inventario fica no autoload `Inventory`, a variavel `itens` contém os itens atuais. Para adicionar ou remover, é usado as respectivas funções no autoload.
As caracteristicas dos itens é encontrado na lista `ITEM_LIST` no autoload, contendo os dados dos itens, neles há 3 caracteristicas comuns
> `TYPE` define o tipo, que é referente as ações que o jogador pode fazer com o item.
> `IMAGE` é o diretorio da imagem icone do item.
> `DESCRIPTION` é o _tooltip_ do item, mostrado quando há sobreposição do mouse sobre o item.
Para adicionar mais itens na `ITEM_LIST`, é necessário criar um novo nome unico no enum `ItemName`, se o item possuir efeito, é será preciso adiciona-lo na func `item_effect` do autoload, seguindo o mesmo padrão.

### Como utilizar em seu projeto
> Crie um autoload nomeado a `Inventory`, adicione o script do `Inventory` a esse autoload.
> mude os nomes dos items no enum `ItemName` para os nomes dos itens do seu jogo e atualize `ItemName` e `item_effect` com os novos nomes.
> Preencha `ItemName` com os dados dos seus itens e os respectivos efeitos em `item_effect`.
> crie uma cena igual a cena `inventory_button.tscn`, com uma label nomeada como "quantity".
> mude o diretorio da const `inv_button` para o diretorio que está o botão.
> Adicione o script `Inventory_node` no seu node que conterá os botões dos itens (um node `HBoxContainer` organizará automaticamente).
> defina o tamanho minimo para os items no inspetor do node `Inventory_node`.
> faça as chamadas de `add_item` e `remove_item` onde for conveniente.

### Uso
No script do node `Main` existe um exemplo de como interagir com os itens. Foi utilizado Inputs, mas você pode utilizar da criatividade para chamar essas funções, como por exemplo:
> chamar `Inventory.add_item(Inventory.ItemName.MAGIC_SWORD, 1)` quando derrotar um chefe
> chamar `Inventory.add_item(Inventory.ItemName.PORTAL_KEY, 1)` quando abrir um baú

### funcionamento
Quando o node chamado `Inventory` estiver na cena, ele irá se conectar com o autoload `Inventory`
```
func _ready():
	var err = Inventory.connect("update_itens", self, "_inventory_update")
```
Apartir de agora, toda vez que o sinal "update_itens" disparar, a função "inventory update" será chamada.
Com isso podemos atualizar os botões da barra de itens quando ouver alteração nos itens.
A função `_inventory_update` irá adicionar os botões ou remover os botões dos itens.

