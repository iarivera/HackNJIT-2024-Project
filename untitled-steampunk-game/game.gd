extends Node2D

var gear1
var gear2
var gear3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gear1 = get_tree().current_scene.get_node("back_and_forth_gear")
	gear2 = get_tree().current_scene.get_node("rotating_gear1")
	gear3 = get_tree().current_scene.get_node("rotating_gear2")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
