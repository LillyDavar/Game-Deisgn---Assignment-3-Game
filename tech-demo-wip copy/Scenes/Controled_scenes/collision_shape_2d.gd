extends CollisionShape2D

@export var destination_level_tag: String
@export var destination_door_tag: String
@export var spawn_direction = "up" 

@onready var spawn = $Spawn

func _on_body_entered(body: Node2D) -> void:
		Dialogic.start("res://Timelines/Red Conversation .dtl")
