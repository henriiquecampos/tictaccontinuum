extends Control

const NO_CONTINUUM_RESTRICTION = -1

var toe = null

var current_continuum_id = NO_CONTINUUM_RESTRICTION
var is_x_turn = false

func _ready():
	toe = get_node("Toe")

func set_continuum_id(continuum_id):
	if toe.has_continuum_game_finished(continuum_id):
		current_continuum_id = NO_CONTINUUM_RESTRICTION
	else:
		current_continuum_id = continuum_id

func get_previous_player():
	if is_x_turn:
		return 'O'
	return 'X'

func can_update(continuum_id):
	var can_update = true
	if current_continuum_id != NO_CONTINUUM_RESTRICTION and current_continuum_id != continuum_id:
		can_update = false
	return can_update

func update(node_id):
	set_continuum_id(node_id)
	is_x_turn = !is_x_turn