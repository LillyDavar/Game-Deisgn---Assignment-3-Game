extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	# If I remove it breaks so its staying.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_scene(scene_path: String):
	get_tree().change_scene_to_file(scene_path)
	# In a timeline, if this script is called we can change the scene. Making some transitions possible.
	# dont break dont break dont break dont break, this is important and I don't really understand strings fully so please dont break.

# Thank you to the Dialogic FAQ for this code. I for some reason could not figure out the string function here.
