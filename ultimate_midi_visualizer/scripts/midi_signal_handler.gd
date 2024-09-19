extends Node

const visualizer_scene = preload("res://scenes/visualizer.tscn")

var raw_controller_number := 1
var raw_midi_value := 1.0
var pc_midi_value := 0.0

var pc_controller_number := 1
var known_raw_controller_numbers := []

func _ready() -> void:
	OS.open_midi_inputs()
	print(OS.get_connected_midi_inputs())

func _input(input_event):
	if input_event is InputEventMIDI:
		_assign_variables(input_event)
		_set_global_variables()

func _assign_variables(midi_event):
	raw_controller_number = midi_event.controller_number
	raw_midi_value = midi_event.controller_value
	pc_midi_value = raw_midi_value / 127
	_adaptable_controller_number_picker()

func _adaptable_controller_number_picker():
	if not raw_controller_number in known_raw_controller_numbers:
		known_raw_controller_numbers.append(raw_controller_number)
		print("new controller number stored !", known_raw_controller_numbers.find(raw_controller_number))
		print("known controller numbers : ", known_raw_controller_numbers)
		_new_controller_events()
	pc_controller_number = known_raw_controller_numbers.find(raw_controller_number)

func _new_controller_events():
	Global.number_of_handled_controllers += 1
	_spawn_new_visualizer()

func _spawn_new_visualizer():
	var new_visualizer = visualizer_scene.instantiate()
	self.add_child(new_visualizer)

func _set_global_variables():
	Global.active_port = raw_controller_number
	Global.active_controller = pc_controller_number
	Global.sensor_value = pc_midi_value
