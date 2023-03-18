extends StaticBody2D


func _ready():
	pass


func _process(delta):
	pass


func hit():
	print_debug("$s hit" % get_instance_id())
	queue_free()
