extends CharacterBody2D

var speed = 400
var dir = Vector2()

enum states {FLY, FOLLOW}

var state = states.FLY


func fly(delta):
	dir += get_gravity() * delta * 1.5
	rotation= dir.angle()
	velocity.y = dir.y
	if Input.is_action_just_pressed("ui_accept"):
		dir = Vector2(speed,-speed)

	move_and_slide()

func follow(delta):
	look_at(get_global_mouse_position())
	dir = get_global_mouse_position() - global_position
	velocity.y = dir.y
	move_and_slide()
	


func  _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("swap"):
		if state == states.FLY:
			state = states.FOLLOW
		elif state == states.FOLLOW:
			state = states.FLY


func _physics_process(delta: float) -> void:
	if state == states.FLY:
		fly(delta)
	else:
		follow(delta)
	


func _on_detector_area_entered(area: Area2D) -> void:
	if area.is_in_group("damage"):
		Global.die.emit()
	
	elif area.is_in_group("score"):
		Global.score += 1
		Global.Score.emit()
		print(Global.score)
