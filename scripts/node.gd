extends Button

const INVALID_ID = -1

var game = null
var continuum = null

var id = INVALID_ID
var player = ''

func _ready():
	continuum = get_parent()
	game = get_node("/root/Game")

func _pressed():
	if game.can_update(continuum.get_id()):
		set_player(game.get_previous_player())
		continuum.update(game.get_previous_player(), id)
		game.update(id)

func get_player():
	return player

func set_player(player):
	self.player = player
	update_text()
	set_disabled(true)

func set_id(id):
	self.id = id

func update_text():
	set_text(player)