extends StaticBody2D

@onready var interactable: Area2D = $interactable
@onready var sprite_2d: Sprite2D

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	Dialogic.start("door interact")
