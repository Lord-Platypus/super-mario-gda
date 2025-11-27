class_name State extends Node

@export var animation_name: String

var parent:Mario

func enter():
	parent.animationController.play(animation_name)

func process_input(delta: float) -> State:
	return null
	
func physics_process(delta: float) -> State:
	return null

func exit() -> void:
	pass
