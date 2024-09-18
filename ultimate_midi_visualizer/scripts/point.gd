extends CharacterBody2D

@onready var circle = $Circle2D


func _ready() -> void:
	_check_point_scale()

func _process(_delta: float) -> void:
	_check_point_scale()

func _check_point_scale():
	self.scale = Vector2(Global.point_scale, Global.point_scale)

func _physics_process(_delta: float) -> void:
	velocity.x = Global.point_speed * -1

	move_and_slide()
