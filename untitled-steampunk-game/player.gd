extends CharacterBody2D

var SPEED = 400
var JUMP = -600
var FALL = 200
var screen_size 
@onready var game = get_tree().get_root().get_node("Game")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("fast_fall") and not is_on_floor():
		velocity.y = FALL
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP
	
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
