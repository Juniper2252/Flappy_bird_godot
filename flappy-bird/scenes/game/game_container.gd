extends Node2D


var game = preload("res://scenes/game/game.tscn")
var gamePause = true
var gameLost = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.die.connect(gameOver)
	var instance = game.instantiate()
	instance.process_mode = Node.PROCESS_MODE_PAUSABLE
	$gameClass.add_child(instance)
	get_tree().paused = true
	
	
	
func gameOver():
	get_tree().paused = true
	$Sprite2D.visible = true
	gameLost = true

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if gamePause:
			if gameLost:
				for i in $gameClass.get_children():
					i.queue_free()
				gameLost = false
				Global.score = 0
				var instance = game.instantiate()
				instance.process_mode = Node.PROCESS_MODE_PAUSABLE
				$gameClass.add_child(instance)
				$Sprite2D.visible = false
				get_tree().paused = false
			else:
				$Sprite2D2.visible = false
				get_tree().paused = false
				$UI.visible = true
				
			
			
