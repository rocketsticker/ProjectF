extends Node


signal completed


@export var number_of_objects = 0


const STRAIGHT_PATH = "res://prefabs/demon_paths/straight_path/StraightPath.tscn"
const WIDE_SINE_DOWN_PATH = "res://prefabs/demon_paths/wide_sine_down_path/WideSineDownPath.tscn"
const WIDE_SINE_UP_PATH = "res://prefabs/demon_paths/wide_sine_up_path/WideSineUpPath.tscn"


var is_spawning: bool = true


var number_of_paths: int = 0
var number_of_completed_path: int = 0


func _process(delta):
	check_progress()


func spawn_one(
	prefab: String,
	slot: int = 1,
	duration: float = 8
):
	var obj = load(prefab).instantiate()
	obj.slot = slot
	obj.tween_duration = duration
	obj.connect("completed", _on_path_completed)
	add_child(obj)
	
	increase_number_of_paths()


func spawn_many(
	prefab: String, 
	times: int = 2, 
	delay_sec: float = 1,
	from_slot: int = 1,
	to_slot: int = 8,
	duration: float = 8,
):
	var current_slot = from_slot
	for n in times:
		spawn_one(prefab, current_slot, duration)
		
		if from_slot < to_slot:
			current_slot = clamp(current_slot + 1, from_slot, to_slot)
		else:
			current_slot = clamp(current_slot - 1, to_slot, from_slot)
			
		await wait_for(delay_sec)


func wait_for(time_sec: float = 1):
	await get_tree().create_timer(time_sec).timeout


func increase_number_of_paths(value: int = 1):
	number_of_paths += value
	

func increase_number_of_completed_paths(value: int = 1):
	number_of_completed_path += value


func check_progress():
	if is_spawning == false:
		if number_of_completed_path == number_of_paths:
			print_debug("DemonWave: %s is completed" % get_instance_id())
			
			completed.emit()
			queue_free()


func _on_path_completed():
	increase_number_of_completed_paths()
