extends "res://prefabs/demon_waves/__extends__/DemonWave.gd"


func _ready():
	await spawn_many(STRAIGHT_PATH, 9, delay_sec, 1, 9, duration)
	await spawn_many(STRAIGHT_PATH, 1, delay_sec, 10, 10, duration)
	await spawn_many(STRAIGHT_PATH, 9, delay_sec, 9, 1, duration)

	is_spawning = false
