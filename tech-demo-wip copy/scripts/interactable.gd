extends Area2D
@export var interact_name: String = ""
@export var is_interactable: bool = true
# base Interactable code, this will be used a lot in the game so DON'T TOUCH IT ANYONE!
# This goes for yourself Lilly, DON'T TOUCH IT.
var interact: Callable = func():
	pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
