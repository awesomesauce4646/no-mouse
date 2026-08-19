extends Node2D

@onready var box: Node2D = $Piece
@onready var info: RichTextLabel = $Info
@onready var end: Node2D = $End
var is_moving = false
var hint = false
var cooldown = false
var won = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("hint") and not cooldown:
		change_hint_text()
	if Input.is_action_pressed("moveRight") and not is_moving:
		move_step()
		
	if won == true:
		get_tree().change_scene_to_file("res://scenes/completion_screen.tscn")

func move_step() -> void:
	is_moving = true
	box.position += Vector2(100, 0)
	await get_tree().create_timer(0.2).timeout
	is_moving = false

func change_hint_text() -> void:
	if hint == false:
		cooldown = true
		hint = true
		info.text = "ARROWS are helpful to point somewhere!"
		await get_tree().create_timer(1).timeout
		cooldown = false
	else:
		cooldown = true
		hint = false
		info.text = "bring the box to the golden zone"
		await get_tree().create_timer(1).timeout
		cooldown = false


func _on_end_end_touched() -> void:
	won = true # Replace with function body.
