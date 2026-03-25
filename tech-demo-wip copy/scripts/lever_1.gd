extends StaticBody2D
# The bed code, used in the begining of the game.
@onready var interactable: Area2D = $interactable
@onready var sprite_2d: Sprite2D
var first_texture = load("res://Assets/Sprites/Tiles/lever-1.png"); 
var second_texture = load("res://Assets/Sprites/Tiles/lever-2.png");
var lever_1 = false

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	Dialogic.start("res://Timelines/Interactions/lever-1.dtl")
	if lever_1 == true:
		$Sprite.set_texture("res://Assets/Sprites/Tiles/lever-2.png")
	# NOTE FOR SELF, see if we can make all the interactables link to one time line, or at least get them grouped like that. That might be fun
