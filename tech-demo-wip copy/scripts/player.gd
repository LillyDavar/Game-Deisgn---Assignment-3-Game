extends CharacterBody2D


const SPEED = 150.0
# speed of player...will have to edit if we add a sprint function , NOTE: Look into sprint function

var last_direction: Vector2 = Vector2.DOWN

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
# connects the animated sprite to a variable that can be controlled in the code.

func _ready() -> void:
	Dialogic.timeline_started.connect(set_physics_process.bind(false))
	Dialogic.timeline_started.connect(set_process_input.bind(false))
	Dialogic.timeline_started.connect(set_process_input.bind(false))

	Dialogic.timeline_ended.connect(set_physics_process.bind(true))
	Dialogic.timeline_ended.connect(set_process_input.bind(true))
	Dialogic.timeline_started.connect(set_process_input.bind(true))
	# code prevents player from walking when they interact with objects

func _physics_process(delta: float) -> void:
	process_movement()
	process_animation(last_direction)
	move_and_slide()
	
func process_movement() -> void:
# setup direction of movement
	var direction = Input.get_vector("left", "right", "up", "down")
# stop diagonal movement by listening for input then setting axis to zero
	if Input.is_action_pressed("right") || Input.is_action_pressed("left"):
		direction.y = 0
	elif Input.is_action_pressed("up") || Input.is_action_pressed("down"):
		direction.x = 0
	else:
		direction = Vector2.ZERO
	# prevents the player from moving when interacting with items and objects.

	
#normalize the directional movement
	direction = direction.normalized()
# setup the actual movement
	if direction != Vector2.ZERO:
		velocity = (direction * SPEED)
		last_direction = direction
	else:
		velocity = Vector2.ZERO
	

func process_animation(direction) -> void:
	if velocity != Vector2.ZERO:
		play_animation("walking", direction)
	else:
		play_animation("idle", direction)

func play_animation(prefix: String, dir: Vector2) -> void:
	# fun little code, based on the dirrection it will play the corresponding animation.
	if dir.x > 0:
		animated_sprite_2d.play(prefix + "_right")
	elif dir.x < 0:
		animated_sprite_2d.play(prefix + "_left")
	elif dir.y < 0:
		animated_sprite_2d.play(prefix + "_up")
	elif dir.y > 0:
		animated_sprite_2d.play(prefix + "_down")
		
