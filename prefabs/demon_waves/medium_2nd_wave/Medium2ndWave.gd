extends "res://prefabs/demon_waves/__extends__/DemonWave.gd"


func _ready():
	spawn_many(NARROW_SINE_DOWN_PATH, 16, delay_sec, 3, 3, duration)
	spawn_many(NARROW_SINE_DOWN_PATH, 16, delay_sec, 7, 7, duration)
	
	await wait_for(delay_sec * 16)
	
	is_spawning = false
