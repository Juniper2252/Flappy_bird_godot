extends Node2D

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var num = rng.randi_range(60, 90)
	$Upper.position.y = -num 
	$Lower.position.y = num

func _process(delta: float) -> void:
	global_position.x -= 10 * delta * 30 
