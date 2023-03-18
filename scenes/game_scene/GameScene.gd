extends Node


func _ready():
	start()


func _process(delta):
	pass


func start():
	$DemonSpawningTimer.start()


func spawn_demon():
	var available_paths = [
		"res://prefabs/demon_paths/straight_path/StraightPath.tscn",
		# "res://prefabs/demon_paths/wide_sine_down_path/WideSineDownPath.tscn",
		# "res://prefabs/demon_paths/wide_sine_up_path/WideSineUpPath.tscn"
	]
	
	var random_path = available_paths.pick_random()
	var path = load(random_path).instantiate()
	
	add_child(path)


func _on_demon_spawning_timer_timeout():
	spawn_demon()
