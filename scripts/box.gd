extends Button

const INVALID_ID = -1

var id = 0
var player = ''

func _ready():
	pass

func set_player(player):
	self.player = player
	update_text()
	show()

func set_id(id):
	pass

func update_text():
	set_text(player)