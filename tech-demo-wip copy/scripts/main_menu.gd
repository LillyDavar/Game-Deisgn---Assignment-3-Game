extends Node2D

@onready var count = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	onCountChanged()

func _input(event: InputEvent) -> void:
	if get_tree().current_scene.name == "MainMenu":
		if event.is_action_pressed("up"):
			count -= 1
			onCountChanged()
		elif event.is_action_pressed("down"):
			count += 1
			onCountChanged()
		elif event.is_action("interact"):
			pressed()
		
		
func getButton():
	if count == 0:
		return $"Button_Manager/New Game"
	elif count == 1:
		return $Button_Manager/Continue
	elif count == 2:
		return $Button_Manager/Settings
	else:
		return $Button_Manager/Credits
		
func onCountChanged():
	if count > 3:
		count = 3
	elif count < 0:
		count = 0
		
	var button = getButton()
	
	button.modulate = Color(1, 1, 1, 1)
	
	for newButton in $Button_Manager.get_children():
		if newButton != button:
			newButton.modulate = Color(0.5, 0.5, 0.5, 0.5)
			
func pressed():
	var button = getButton()
	
	if button.name == "New Game":
		get_tree().change_scene_to_file("res://Scenes/Controled_scenes/Controls.tscn") 
	elif button.name == "Continue":
		get_tree().change_scene_to_file("res://Scenes/Maps/game_screen.tscn")
	elif button.name == "Settings":
		get_tree().change_scene_to_file("res://Scenes/settings.tscn")
	elif button.name == "Credits":
		get_tree().change_scene_to_file("res://Scenes/Controled_scenes/credits.tscn")
