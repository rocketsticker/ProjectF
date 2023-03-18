extends "res://prefabs/demon_waves/__extends__/DemonWave.gd"


func _ready():
	var delay_sec = .25
	var duration = 2
	
	await spawn_many(STRAIGHT_PATH, 10, delay_sec, 1, 10, duration)
	await wait_for(duration)
	await spawn_many(STRAIGHT_PATH, 10, delay_sec, 10, 1, duration)

	is_spawning = false
