extends Node2D

@onready var end: Area2D = $Area2D # grabs the parent node
@onready var piece = $"../Piece/Area2D"

# make a signal
signal end_touched

func _process(delta: float) -> void: # this runs EVERY FRAME! 
	
	if piece.overlaps_area(end): # checks if overlapping
			emit_signal("end_touched") #signal broadcast
		
