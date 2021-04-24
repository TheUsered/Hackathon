extends Node2D

onready var tilemap = $TileMap
onready var player = preload("res://scenes/player.tscn")

func _ready():
	randomize()
	
	var pos = Vector2()
	var speed = Vector2(0, 0)
	for i in range(400):
		var choice = round(rand_range(1, 4))
		if choice == 1:
			speed = Vector2(1, 0)
		elif choice == 2:
			speed = Vector2(-1, 0)
		elif choice == 3:
			speed = Vector2(0, 1)
		elif choice == 4:
			speed = Vector2(0, -1)
		
		if pos.y >= 9 or pos.y <= -9 or pos.x >= 17 or pos.x <= -17:
			pos = Vector2()
			speed *= Vector2(-1, -1)
		
		pos += speed
		tilemap.set_cellv(pos, -1)
	
	var startpos = Vector2(0, 0)
	var p = player.instance()
	p.position = startpos
	add_child(p)
