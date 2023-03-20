extends "res://prefabs/demon_waves/__extends__/DemonWave.gd"


func _ready():
	await spawn_many(WIDE_SINE_DOWN_PATH, 10, delay_sec, -1, -1, duration)
	await spawn_many(WIDE_SINE_UP_PATH, 10, delay_sec, -1, -1, duration)
	
	is_spawning = false
