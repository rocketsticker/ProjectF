extends "res://prefabs/demon_waves/__extends__/DemonWave.gd"


func _ready():
	var delay_sec = .5
	var duration = 4
	
	await spawn_many(WIDE_SINE_DOWN_PATH, 10, delay_sec, 1, 1, duration)
	await wait_for(delay_sec * 4)
	await spawn_many(WIDE_SINE_UP_PATH, 10, delay_sec, 10, 10, duration)

	is_spawning = false
