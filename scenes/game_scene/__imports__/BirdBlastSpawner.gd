extends Node


@export var delay_sec = 1


const STRAIGHT_PATH = "res://prefabs/bird_blast_paths/straight_path/StraightPath.tscn"

const SPAWN_X_OFFSET = 32


func _ready():
	start()


func _process(delta):
	pass


func start():
	await wait_for(1)
	
	while true:
		spawn_path()
		await wait_for(delay_sec)


func spawn_path():
	var bird_pos = get_bird_pos()
	if bird_pos == null:
		return
	
	var path = load(STRAIGHT_PATH).instantiate()
	path.position.x = bird_pos.x + SPAWN_X_OFFSET
	path.position.y = bird_pos.y
	
	get_tree().root.add_child(path)

# Returns position of the first bird in the group, `null` if not found.
func get_bird_pos():
	var bird = get_tree().get_first_node_in_group("birds")
	if bird == null:
		return null
		
	return bird.position


func wait_for(time_sec: float):
	await get_tree().create_timer(time_sec).timeout
