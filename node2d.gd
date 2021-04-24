extends Node2D

onready var tilemap = $TileMap
onready var player = preload("res://scenes/player.tscn")

func _ready():
	randomize()
	for i in range(150 * 4):
		randomize()
		var position = Vector2(rand_range(-15, 15), rand_range(-8, 8))
		tilemap.set_cellv(position, -1)
	
	var startpos = Vector2(0, 0)
	var p = player.instance()
	p.position = startpos
	add_child(p)
	
	
