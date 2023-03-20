extends Node


var current_wave = 4


func _ready():
	spawn_wave()


func _process(delta):
	pass


func spawn_wave():
	var available_wave_prefabs = [
		"res://prefabs/demon_waves/easy_1st_wave/Easy1stWave.tscn",
		"res://prefabs/demon_waves/easy_2nd_wave/Easy2ndWave.tscn",
		"res://prefabs/demon_waves/easy_3nd_wave/Easy3ndWave.tscn",
		"res://prefabs/demon_waves/easy_4th_wave/Easy4thWave.tscn",
		"res://prefabs/demon_waves/medium_1st_wave/Medium1stWave.tscn"
	]
	
	var next_wave_prefab = available_wave_prefabs[current_wave % available_wave_prefabs.size()]
	var next_wave = load(next_wave_prefab).instantiate()
	next_wave.connect("completed", spawn_wave)
	
	add_child(next_wave)
	
	current_wave += 1
