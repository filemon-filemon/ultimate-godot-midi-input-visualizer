extends HBoxContainer

@onready var sle = $PysicsSettings/SpeedSettings/SpeedLineEdit
@onready var fle = $PysicsSettings/FreqSettings/FreqLineEdit
@onready var zle = $EstheticSettings/ScaleSettings/ScaleLineEdit


@export var s_margin = 10
var input_is_conform : bool

func _ready() -> void:
	_automate_main_window_size()
	_set_placeholder_texts()

func _set_placeholder_texts():
	sle.placeholder_text = str(Global.point_speed)
	fle.placeholder_text = str(Global.points_spawn_rate)
	zle.placeholder_text = str(Global.point_scale)

func _automate_main_window_size():
	get_viewport().size = self.size + Vector2(s_margin*2,s_margin*2)
	self.position = Vector2(s_margin,s_margin)

func _on_speed_line_edit_text_submitted(new_text: String) -> void:
	_check_if_float(new_text)
	if input_is_conform:
		Global.point_speed = float(new_text)

func _on_freq_line_edit_text_submitted(new_text: String) -> void:
	_check_if_float(new_text)
	if input_is_conform:
		Global.points_spawn_rate = float(new_text)

func _on_scale_line_edit_text_submitted(new_text: String) -> void:
	_check_if_float(new_text)
	if input_is_conform:
		Global.point_scale = float(new_text)

func _check_if_float(new_text):
	if float(new_text) > 0:
		input_is_conform = true
	else:
		input_is_conform = false
