extends KinematicBody2D

onready var ray = $"RayCast2D"
var vel = Vector2(0, 120)

func _process(delta):
		if ray.is_colliding():
			rotation_degrees += 180
			vel.y *= -1
			
		move_and_slide(vel)
