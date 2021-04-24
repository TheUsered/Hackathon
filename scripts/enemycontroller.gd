extends KinematicBody2D

onready var ray = $"ray"
onready var rayFloor = $"rayFloor"
#onready var player = $"../player"
onready var barProgress = $"VBoxContainer/TextureProgress"
onready var attackArea = $"attackArea"
var vel = Vector2(0, 120)
#onready var target = $"../player"
var enemyTarget = global_position
func _process(delta):
	enemyTarget = global_position
	
	if rayFloor.is_colliding():
		var number =(randi()%4)
		if number == 0:
			rayFloor.rotation_degrees = 90
			vel.y = 0
			vel.x = -120
			print("right")
		if number == 1:
			rayFloor.rotation_degrees = 180
			vel.y = -120
			vel.x = 0
			print("up")
		if number == 2:
			rayFloor.rotation_degrees = 270
			vel.y = 0
			vel.x = 120
			print("left")
		if number == 3:
			rayFloor.rotation_degrees = 0
			vel.y = 120
			vel.x = 0
			print("down")
		
	move_and_slide(vel)
	
	

enum STATES {IDLE, ATTACKING}
var state = STATES.IDLE
signal area_entered
export var strength = 6

func damage_target(target, damage):
	if target.has_method("take_damage"):
		target.take_damage(damage)



func _on_attackArea_body_entered(body):

	damage_target(body,3)

#enemy health
export var enemyMaxHealth = 50
var enemyHealth = enemyMaxHealth

enum STATESLife {ALIVE, DEAD}
var statelife = STATESLife.ALIVE
func take_damage(count):
	if statelife == STATESLife.DEAD:
		return
	print_debug("hello2.0")
	enemyHealth -= count
	if enemyHealth <= 0:
		enemyHealth = 0
		print("imdead")
		statelife = STATESLife.DEAD
		emit_signal("died")
func damage(dam):
	print("itookdamage")
	take_damage(dam)
	barProgress.damage(dam)
