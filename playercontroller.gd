extends KinematicBody2D

var speed = 240

onready var anim = $animatedSprite

func _process(delta):

	
	var vel = Vector2()
	
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed

	elif Input.is_action_pressed("ui_right"):
		vel.x += speed
	elif Input.is_action_pressed("ui_up"):
		vel.y -= speed
	elif Input.is_action_pressed("ui_down"):
		vel.y += speed

	
	move_and_slide(vel)

func die():
	Engine.time_scale = 0
