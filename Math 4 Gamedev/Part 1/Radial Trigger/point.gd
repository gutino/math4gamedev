extends Node2D

export(Color) var color := Color(0, 0, 1, 1)

var pos := Vector2(250, 250)


func _process(delta):
	pos = get_viewport().get_mouse_position()
	update()

func _draw():
	draw_circle(pos, 5.0, color)
