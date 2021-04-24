extends KinematicBody2D

onready var ray = $"RayCast2D"
onready var player = $"../player"
var vel = Vector2(0, 120)

func _process(delta):
	if ray.is_colliding():
		var coll = ray.get_collider()
		if coll.has_method("die"):
			coll.die()
		else:
			rotation_degrees += 180
			vel.y *= -1
		
	move_and_slide(vel)
