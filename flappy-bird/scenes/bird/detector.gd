extends Area2D

signal die

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("damage"):
		die.emit()
