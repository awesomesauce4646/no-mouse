extends Node2D

@onready var info: RichTextLabel = $Info
@onready var word: RichTextLabel = $Word

var hint = false
var cooldown = false
var won = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("hint") and not cooldown:
		change_hint_text()

	_won()
	
	if won == true:
		info.text = "woah!"
		word.show()
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scenes/completion_screen.tscn")

func change_hint_text() -> void:
	if hint == false:
		cooldown = true
		hint = true
		info.text = "maybe search for it?"
		await get_tree().create_timer(1).timeout
		cooldown = false
	else:
		cooldown = true
		hint = false
		info.text = "find the word"
		await get_tree().create_timer(1).timeout
		cooldown = false


func _won() -> void:
	if Input.is_action_pressed("find"):
		won = true
