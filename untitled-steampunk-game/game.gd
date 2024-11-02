extends Node2D

var gear1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gear1 = get_tree().current_scene.get_node("back_and_forth_gear")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
