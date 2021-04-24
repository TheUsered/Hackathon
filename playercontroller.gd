extends KinematicBody2D

var speed = 240
var health = 50

onready var anim = $animatedSprite

func _process(delta):
	Engine.time_scale = 0
	
	$healthtext.text = str(health)
	
	if health <= 0:
		get_tree().quit()
	
	var vel = Vector2()
	
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed
		Engine.time_scale = 1
		anim.play("walk")
		anim.flip_h = false
	elif Input.is_action_pressed("ui_right"):
		vel.x += speed
		Engine.time_scale = 1
		anim.play("walk")
		anim.flip_h = true
	elif Input.is_action_pressed("ui_up"):
		vel.y -= speed
		Engine.time_scale = 1
		anim.play("walk")
	elif Input.is_action_pressed("ui_down"):
		vel.y += speed
		Engine.time_scale = 1
		anim.play("walk")
	
	move_and_slide(vel)

func die(d):
	health -= d
