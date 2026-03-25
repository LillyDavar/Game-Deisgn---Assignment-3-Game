extends StaticBody2D
# The bed code, used in the begining of the game.
@onready var interactable: Area2D = $interactable
@onready var sprite_2d: Sprite2D

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	Dialogic.start("res://Timelines/Conversations/Starlight Conversations.dtl")
	# NOTE FOR SELF, see if we can make all the interactables link to one time line, or at least get them grouped like that. That might be fun
