extends Node


func _ready():
	spawn_wave()


func _process(delta):
	pass


func spawn_wave():
	var available_wave_prefabs = [
		"res://prefabs/demon_waves/easy_one_wave/EasyOneWave.tscn",
	]
	
	var random_wave_prefab = available_wave_prefabs.pick_random()
	var random_wave = load(random_wave_prefab).instantiate()
	random_wave.connect("completed", spawn_wave)
	
	add_child(random_wave)
