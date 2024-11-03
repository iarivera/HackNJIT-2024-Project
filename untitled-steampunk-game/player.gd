extends CharacterBody2D

var SPEED = 300
var JUMP = -600
var FALL = 300
var screen_size 
var state = 0
@onready var game = get_tree().get_root().get_node("Game")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP
	if Input.is_action_just_pressed("fast_fall") and not is_on_floor():
		velocity.y = FALL
	
	if not is_on_floor():
		if velocity.y > 0 and state == 0:
			$AnimatedSprite2D.play("fall_right")
		elif velocity.y > 0 and state == 1:
			$AnimatedSprite2D.play("fall_left")
		elif velocity.y < 0 and state == 0:
			$AnimatedSprite2D.play("jump_right")
		elif velocity.y < 0 and state == 1:
			$AnimatedSprite2D.play("jump_left")
		
	if is_on_floor():
		var direction := Input.get_axis("move_left", "move_right")
		if direction:
			velocity.x = direction * SPEED
			if velocity.x > 0:
				$AnimatedSprite2D.play("run_right")
				state = 0
			else:
				$AnimatedSprite2D.play("run_left")
				state = 1
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			if state == 0:
				$AnimatedSprite2D.play("idle_right")
			else:
				$AnimatedSprite2D.play("idle_left")
	move_and_slide()
