extends TextureProgress


onready var bar = $"../TextureProgress"
onready var tween = $"../Tween2"

# Called when the node enters the scene tree for the first time.
var animated_health = 0


func _ready():
	#var enemy_max_health = 50
	damage(50)


#func _on_Player_health_changed(player_health):
	#update_health(player_health)

func damage(dam):
	print("tween is called")
	tween.interpolate_property(self, "animated_health", animated_health, dam, 0.6, Tween.TRANS_LINEAR, Tween.EASE_IN)
	if not tween.is_active():
		tween.start()

func _on_Player_died():
	var start_color = Color(1.0, 1.0, 1.0, 1.0)
	var end_color = Color(1.0, 1.0, 1.0, 0.0)
	tween.interpolate_property(self, "modulate", start_color, end_color, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	
func _process(delta):
	var round_value = round(animated_health)
	bar.value = round_value
