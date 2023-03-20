extends "res://prefabs/demon_waves/__extends__/DemonWave.gd"


func _ready():
	for n in 2:
		spawn_one(STRAIGHT_PATH, 1, duration)
		spawn_one(STRAIGHT_PATH, 3, duration)
		spawn_one(STRAIGHT_PATH, 5, duration)
		
		await wait_for(delay_sec * 4)
		
		spawn_one(STRAIGHT_PATH, 2, duration)
		spawn_one(STRAIGHT_PATH, 4, duration)
		spawn_one(STRAIGHT_PATH, 6, duration)
		
		await wait_for(delay_sec * 4)
		
		spawn_one(STRAIGHT_PATH, 3, duration)
		spawn_one(STRAIGHT_PATH, 5, duration)
		spawn_one(STRAIGHT_PATH, 7, duration)
		
		await wait_for(delay_sec * 4)
		
		spawn_one(STRAIGHT_PATH, 4, duration)
		spawn_one(STRAIGHT_PATH, 6, duration)
		spawn_one(STRAIGHT_PATH, 8, duration)
		
		await wait_for(delay_sec * 4)
	
	is_spawning = false
