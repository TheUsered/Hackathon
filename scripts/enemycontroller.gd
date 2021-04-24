extends KinematicBody2D

onready var ray = $"ray"
onready var rayFloor = $"rayFloor"
onready var player = $"../player"
onready var attackArea = $"attackArea"
var vel = Vector2(0, 120)
onready var target = $"../player"
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
		
		#rayFloor.rotation_degrees += 180
		#vel.y *= -1
	move_and_slide(vel)
	
	

enum STATES {IDLE, ATTACKING}
var state = STATES.IDLE
signal area_entered
export var strength = 6

func damage_target(target, damage):
	target.take_damage(damage)

func enemyAttack(name):
	if name == "attack":
		state = STATES.IDLE
	if name == "anticipate":
		damage_target(target, strength)

func _on_Player_died():
	target = null

func _on_attackArea_area_entered(area):
	print ("area signaled")
	enemyAttack("anticipate")

func _on_attackArea_body_entered(body):
	print ("body signaled")
	enemyAttack("anticipate")
