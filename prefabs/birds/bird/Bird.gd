extends Area2D


@export var speed = 10


const ABOVE_OFFSET = 64
const BELOW_OFFSET = 128
const LEFT_OFFSET = 128


var screen_size: Vector2


func _ready():
	screen_size = get_viewport_rect().size
	pass


func _process(delta):
	move_to_mouse_point(delta)
	pass


func move_to_mouse_point(delta: float):
	var dest: Vector2 = get_viewport().get_mouse_position()
	dest.x = LEFT_OFFSET
	dest.y = clamp(dest.y, ABOVE_OFFSET, screen_size.y - BELOW_OFFSET)
	
	var vect: Vector2 = dest - position
	position = position + (vect * delta * speed)
