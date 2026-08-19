extends Node2D

@onready var play: Button = $Play

var pressPlay = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pressPlay = Input.is_action_pressed("enter")
	if pressPlay == true:
		get_tree().change_scene_to_file("res://scenes/level_1.tscn") 
