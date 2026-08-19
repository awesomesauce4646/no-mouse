extends Node2D

@onready var info: RichTextLabel = $Info
@onready var letter1: Button = $Letter1
@onready var letter2: Button = $Letter2
@onready var letter3: Button = $Letter3
@onready var letter4: Button = $Letter4


var hint = false
var cooldown = false
var won = false
var firstDone = false
var secondDone = false
var thirdDone = false
var fourthDone = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("hint") and not cooldown:
		change_hint_text()
		
	if Input.is_action_pressed("c"):
		letter1.modulate = Color(0,1,0)
		firstDone = true
	if Input.is_action_pressed("a"):
		letter2.modulate = Color(0,1,0)
		secondDone = true
	if Input.is_action_pressed("t"):
		letter3.modulate = Color(0,1,0)
		thirdDone = true
	if Input.is_action_pressed("s"):
		letter4.modulate = Color(0,1,0)
		fourthDone = true
	_won()
	
	if won == true:
		get_tree().change_scene_to_file("res://scenes/completion_screen.tscn")

func change_hint_text() -> void:
	if hint == false:
		cooldown = true
		hint = true
		info.text = "spell out the provided word!"
		await get_tree().create_timer(1).timeout
		cooldown = false
	else:
		cooldown = true
		hint = false
		info.text = "spelling bee"
		await get_tree().create_timer(1).timeout
		cooldown = false


func _won() -> void:
	if firstDone && secondDone && thirdDone && fourthDone:
		won = true
