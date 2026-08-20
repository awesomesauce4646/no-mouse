extends Node2D

@onready var info: RichTextLabel = $Info
@onready var x: TextureRect = $X

var hint = false
var cooldown = false
var won = false
var pressedPlus = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("hint") and not cooldown:
		change_hint_text()		
	if Input.is_action_pressed("plus"):
		x.show()
		info.text = "ahooyy me treasure!"
		await get_tree().create_timer(2).timeout
		won = true
	_won()
	
	if won == true:
		get_tree().change_scene_to_file("res://scenes/completion_screen.tscn")

func change_hint_text() -> void:
	if hint == false:
		cooldown = true
		hint = true
		info.text = "look closer... "
		await get_tree().create_timer(1).timeout
		cooldown = false
	else:
		cooldown = true
		hint = false
		info.text = "x marks the spot"
		await get_tree().create_timer(1).timeout
		cooldown = false


func _won() -> void:
	if Input.is_action_pressed("plus"):
		won = true
