extends Window

@onready var gc = $GarbageCollector
@onready var sm = $SpawnMarker
@onready var ven = $VisualizerEditableName
@onready var mpn = $MidiPortNumber

@export var margin := 10

const point_scene = preload("res://scenes/point.tscn")

var vx : float
var vy : float
var vn : int

func _ready() -> void:
	_set_visualizer_name()
	#_on_size_changed()
	await get_tree().create_timer(0.1).timeout
	_points_spawn_cycle()

func _set_visualizer_name():
	vn = Global.number_of_handled_controllers
	ven.placeholder_text = str(vn)

func _set_midi_port_number():
	mpn.text = "PORT: " + str(Global.active_port)

func _on_size_changed() -> void:
	await get_tree().create_timer(0.1).timeout
	_set_size_var()
	_rearrange_elements()

func _process(_delta: float) -> void:
	if Global.active_controller == vn:
		_spawn_marker_follow_sensor()
		_set_midi_port_number()

func _spawn_marker_follow_sensor():
	sm.position.y = Global.sensor_value * vy

func _set_size_var():
	vx = self.size.x
	vy = self.size.y

func _rearrange_elements():
	_rearrange_garbage_collector()
	_rearrange_spawn_marker()
	_rearrange_visualizer_number()
	_rearrange_midi_port_number()

func _rearrange_garbage_collector():
	gc.position.y = vy / 2
	gc.scale.y = (vy / 100) * 7

func _rearrange_spawn_marker():
	sm.position.x = vx - margin

func _rearrange_visualizer_number():
	ven.position.x = vx - self.size.x

func _rearrange_midi_port_number():
	mpn.position.y = vy - mpn.size.y

func _points_spawn_cycle():
	_spawn_point()
	await get_tree().create_timer(Global.points_spawn_rate).timeout
	_points_spawn_cycle()

func _spawn_point():
	var new_point = point_scene.instantiate()
	new_point.position = sm.global_position
	self.add_child(new_point)


func _on_garbage_collector_body_entered(body: Node2D) -> void:
	body.queue_free()
