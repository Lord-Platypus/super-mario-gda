class_name StateMachine extends Node

@export
var starting_state: State 

var current_state:State

func init() -> void:
	var parent= get_parent()
	for child in get_children():
		child.parent = parent
	change_state(starting_state)
	
func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()
	
func _process(delta: float) -> void:
	var new_state = current_state.process_input(delta)
	if new_state:
		change_state(new_state)
	
func _physics_process(delta: float) -> void:
	var new_state = current_state.physics_process(delta)
	if new_state:
		change_state(new_state)
