extends KinematicBody2D

var speed = 240
var health = 50
var damage = 10

onready var anim = $animatedSprite

func _process(delta):
	
	$healthtext.text = str(health)
	
	if Input.is_action_just_pressed("ui_accept"):
		anim.play("punch")
		var coll = $"Area2D".get_overlapping_bodies()
		for e in coll:
			if e.has_method("damage"):
				e.damage(damage)
	
	if health <= 0:
		get_tree().quit()
	
	var vel = Vector2()
	
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed
		anim.play("walk")
		anim.flip_h = false
	elif Input.is_action_pressed("ui_right"):
		vel.x += speed
		anim.play("walk")
		anim.flip_h = true
	elif Input.is_action_pressed("ui_up"):
		vel.y -= speed
		anim.play("walk")
	elif Input.is_action_pressed("ui_down"):
		vel.y += speed
		anim.play("walk")
	
	move_and_slide(vel)

func take_damage(d):
	health -= d
