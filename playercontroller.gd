extends KinematicBody2D

var speed = 240
var health = 50

func _process(delta):
	Engine.time_scale = 0
	
	$healthtext.text = str(health)
	
	if health <= 0:
		Engine.time_scale = 0
	
	var vel = Vector2()
	
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed
		Engine.time_scale = 1
	elif Input.is_action_pressed("ui_right"):
		vel.x += speed
		Engine.time_scale = 1
	elif Input.is_action_pressed("ui_up"):
		vel.y -= speed
		Engine.time_scale = 1
	elif Input.is_action_pressed("ui_down"):
		vel.y += speed
		Engine.time_scale = 1
	
	move_and_slide(vel)

func die(d):
	health -= d
