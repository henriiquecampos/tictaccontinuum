extends GridContainer

const INVALID_ID = -1

var toe = null

var id = INVALID_ID
var x_nodes = [ ]
var y_nodes = [ ]
var player = ''

var nodes = null

func _ready():
	toe = get_parent()
	nodes = get_children()
	set_nodes_id()

func set_nodes_id():
	var node_id = 0
	for node in nodes:
		node.set_id(node_id)
		node_id += 1

func get_id():
	return id

func set_id(id):
	self.id = id

func has_game_finished():
	return player.length() > 0

func update(player, node_id):
	increment_play(player, node_id)
	if player == 'X':
		if x_nodes.size() > 2 and toe.has_victory(x_nodes):
			self.player = player
			finish_continuum()
	elif y_nodes.size() > 2 and toe.has_victory(y_nodes):
		self.player = player
		finish_continuum()

func finish_continuum():
	for node in nodes:
		node.hide()
	nodes[0].set_player(player)
	nodes[0].show()
	toe.update(player, id)

func increment_play(player, node_id):
	if player == 'X':
		x_nodes.push_back(node_id)
	else:
		y_nodes.push_back(node_id)