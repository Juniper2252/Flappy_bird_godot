extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$TextureRect2.global_position.x -= 5
	$TextureRect3.global_position.x -= 5
	if $TextureRect2.global_position.x <= -1176:
		$TextureRect2.global_position.x = $TextureRect3.global_position.x + 1176
	if $TextureRect3.global_position.x <= -1176:
		$TextureRect3.global_position.x = $TextureRect2.global_position.x + 1176
	
