extends Path2D


signal completed


@export var object_prefab: String = "res://prefabs/demons/demon/Demon.tscn"


@export var slot: int = -1 # Set to -1 to make it randomly pick a slot, default to -1.
@export var min_slot: int = 1
@export var max_slot: int = 8
@export var slot_offset: int = 64


@export var tween_trans: Tween.TransitionType = Tween.TRANS_LINEAR
@export var tween_ease: Tween.EaseType = Tween.EASE_IN
@export var tween_duration: float = 8 # Seconds, slower is faster.


func _process(delta):
	check_progress()


func start():
	adjust_position()
	add_object()
	start_progress()


func adjust_position():
	var spawn_slot = randi_range(min_slot, max_slot) if slot == -1 else slot
	position.y = slot_offset * spawn_slot


func add_object():
	var obj = load(object_prefab).instantiate()
	$PathFollow2D.add_child(obj)


func start_progress():
	var tween = create_tween().set_trans(tween_trans).set_ease(tween_ease)
	tween.tween_property($PathFollow2D, "progress_ratio", 1, tween_duration)


func check_progress():
	if $PathFollow2D.progress_ratio == 1:
		print_debug("%s is completed" % get_instance_id())
		
		completed.emit()
		queue_free()
