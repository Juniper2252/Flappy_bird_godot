extends Node2D

var pipes = preload("res://scenes/pipes/pipes.tscn")
var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$spawnRate.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_spawn_rate_timeout() -> void:
	$spawnRate.wait_time = rng.randf_range(1,3)
	
	
	var num = rng.randfn(0.5,0.5)
	%PathFollow2D.progress_ratio = num
	var instance = pipes.instantiate()
	instance.global_position = %PathFollow2D.global_position
	$pipes.add_child(instance)
