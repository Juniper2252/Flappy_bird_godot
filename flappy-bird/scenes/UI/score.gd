extends Node2D


var scores = {
	0: preload("res://assets/flappy-bird-assets-master/sprites/0.png"),
	1: preload("res://assets/flappy-bird-assets-master/sprites/1.png"),
	2: preload("res://assets/flappy-bird-assets-master/sprites/2.png"),
	3: preload("res://assets/flappy-bird-assets-master/sprites/3.png"),
	4: preload("res://assets/flappy-bird-assets-master/sprites/4.png"),
	5: preload("res://assets/flappy-bird-assets-master/sprites/5.png"),
	6: preload("res://assets/flappy-bird-assets-master/sprites/6.png"),
	7: preload("res://assets/flappy-bird-assets-master/sprites/7.png"),
	8: preload("res://assets/flappy-bird-assets-master/sprites/8.png"),
	9: preload("res://assets/flappy-bird-assets-master/sprites/9.png")
}

func _ready() -> void:
	Global.Score.connect(scoreAdd)

func scoreAdd():
	var num = Global.score
	if len(str(num)) == 1:
		$"1".texture = scores[0]
		$"2".texture = scores[num]
	else:
		$"1".texture = scores[int(str(num)[0])]
		$"2".texture = scores[int(str(num)[1])]
