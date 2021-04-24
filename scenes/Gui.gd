extends MarginContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var number_label = $HBoxContainer/bars/bar/MarginContainer/background/number
onready var bar = $HBoxContainer/bars/bar/TextureProgress
onready var tween = $Tween

# Called when the node enters the scene tree for the first time.
var animated_health = 0


func _ready():
	var player_max_health = 100
	update_health(player_max_health)


func _on_Player_health_changed(player_health):
	update_health(player_health)


func update_health(new_value):
	tween.interpolate_property(self, "animated_health", animated_health, new_value, 0.6, Tween.TRANS_LINEAR, Tween.EASE_IN)
	if not tween.is_active():
		tween.start()


func _process(delta):
	var round_value = round(animated_health)
	number_label.text = str(round_value)
	bar.value = round_value


func _on_Player_died():
	var start_color = Color(1.0, 1.0, 1.0, 1.0)
	var end_color = Color(1.0, 1.0, 1.0, 0.0)
	tween.interpolate_property(self, "modulate", start_color, end_color, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	
func _on_player_health_changed(player_health):
	print_debug("hello")
	update_health(player_health)
