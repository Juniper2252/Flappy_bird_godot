extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.die.connect(gameOver)


func gameOver():
	print("hi!")
	$"Game".paused = true
	
