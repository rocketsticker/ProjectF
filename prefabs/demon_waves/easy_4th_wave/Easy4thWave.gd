extends "res://prefabs/demon_waves/__extends__/DemonWave.gd"


func _ready():
	await spawn_many(STRAIGHT_PATH, 16, delay_sec, -1, -1, duration)
	
	is_spawning = false
