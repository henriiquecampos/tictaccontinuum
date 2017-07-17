extends GridContainer

var is_active = true
var x_continuums = [ ]
var y_continuums = [ ]
var player = ''

var continuums = null

func _ready():
	continuums = get_children()
	set_continuums_ids()

func set_continuums_ids():
	var continuum_id = 0
	for continuum in continuums:
		continuum.set_id(continuum_id)
		continuum_id += 1

func has_continuum_game_finished(continuum_id):
	return continuums[continuum_id].has_game_finished()

func update(player, continuum_id):
	increment_play(player, continuum_id)
	if player == 'X':
		if x_continuums.size() > 2 and has_victory(x_continuums):
			self.player = player
			finish_toe()
	elif y_continuums.size() > 2 and has_victory(y_continuums):
			self.player = player
			finish_toe()

func has_victory(element_ids):
	return won_by_center(element_ids) or won_by_sides(element_ids)

func won_by_center(element_ids):
	var won = false
	if element_ids.has(5):
		if element_ids.has(1):
			if element_ids.has(9):
				won = true
		elif element_ids.has(2):
			if element_ids.has(8):
				won = true
		elif element_ids.has(3):
			if element_ids.has(7):
				won = true
		elif element_ids.has(4):
			if element_ids.has(6):
				won = true
	return won

func won_by_sides(element_ids):
	var won = false
	if element_ids.has(1):
		if element_ids.has(2):
			if element_ids.has(3):
				won = true
		elif element_ids.has(4):
			if element_ids.has(7):
				won = true
	if not won and element_ids.has(9):
		if element_ids.has(8):
			if element_ids.has(7):
				won = true
		elif element_ids.has(6):
			if element_ids.has(3):
				won = true
	return won

func finish_toe():
	for continuum in continuums:
		continuum.hide()
	continuums[0].set_player(player)
	continuums[0].show()

func increment_play(player, continuum_id):
	if player == 'X':
		x_continuums.push_back(continuum_id)
	else:
		y_continuums.push_back(continuum_id)