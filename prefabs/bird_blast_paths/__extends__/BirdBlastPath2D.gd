extends Path2D


@export var object_prefab: String = "res://prefabs/bird_blasts/normal_blast/NormalBlast.tscn"

@export var tween_trans: Tween.TransitionType = Tween.TRANS_LINEAR
@export var tween_ease: Tween.EaseType = Tween.EASE_IN
@export var tween_duration: float = 1 # Seconds, slower is faster.


func _ready():
	pass


func _process(delta):
	check_progress()


func start():
	add_object()
	start_progress()


func add_object():
	var obj = load(object_prefab).instantiate()
	$PathFollow2D.add_child(obj)


func start_progress():
	var tween = create_tween().set_trans(tween_trans).set_ease(tween_ease)
	tween.tween_property($PathFollow2D, "progress_ratio", 1, tween_duration)


func check_progress():
	if $PathFollow2D.progress_ratio == 1:
		print_debug("BirdBlastPath2D: %s is completed" % get_instance_id())
		
		queue_free()
