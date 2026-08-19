extends Node2D

@onready var level: RichTextLabel = $Background/Title
@onready var themed_timer: Node2D = $Timer

var timer_end = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await themed_timer.Timer(3.0)
	#after this is completed...
	timer_end = true 




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	level.text = "nice! 
level " + str(Global.level) + " 
completed! "
	if timer_end == true:
		Global.level += 1
		get_tree().change_scene_to_file("res://scenes/level_" + str(Global.level) + ".tscn")
