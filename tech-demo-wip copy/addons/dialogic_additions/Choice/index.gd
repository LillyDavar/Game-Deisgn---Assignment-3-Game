@tool
extends DialogicIndexer

func _get_subsystems() -> Array:
	return [{'name':'Choice', 'script':this_folder.path_join('subsystem_choice.gd')}]