extends "res://prefabs/demon_waves/__extends__/DemonWave.gd"


func _ready():
	spawn_many(WIDE_SINE_DOWN_PATH, 16, delay_sec, 1, 1, duration)	
	spawn_many(WIDE_SINE_UP_PATH, 16, delay_sec, 10, 10, duration)
	
	await wait_for(delay_sec * 16)
	
	is_spawning = false
