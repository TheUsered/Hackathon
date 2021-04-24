extends KinematicBody2D
var target = global_position
func _process(delta):
	target = global_position
export (int) var speed = 200

var vel = Vector2()

func get_input():
	vel = Vector2()
	if Input.is_action_pressed("ui_right"):
		vel.x += 1
	if Input.is_action_pressed("ui_left"):
		vel.x -= 1
	if Input.is_action_pressed("ui_down"):
		vel.y += 1
	if Input.is_action_pressed("ui_up"):
		vel.y -= 1
	vel = vel.normalized() * speed

func _physics_process(delta):
	get_input()
	vel = move_and_slide(vel)
	


signal health_changed
signal died
export var max_health = 100
var health = max_health

# When the character dies, we fade the UI
enum STATES {ALIVE, DEAD}
var state = STATES.ALIVE
func take_damage(count):
	if state == STATES.DEAD:
		return
	print_debug("hello")
	health -= count
	if health <= 0:
		health = 0
		state = STATES.DEAD
		emit_signal("died")


	emit_signal("health_changed", health)


	if state != STATES.DEAD:
		return
	if name != "take_hit":
		return
