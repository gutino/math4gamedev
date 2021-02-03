extends Node2D

export(Color) var color := Color(1, 1, 1, 1)
export(Color) var normal_color := Color(0, 0, 1, 0.1)
export(Color) var trigger_color := Color(1, 0, 0, 0.1)
export(int) var radius := 200

var from := Vector2(0, 0)
var to := Vector2(0, 0)

var point: Node
var point_pos: Vector2
var norm_pos: Vector2
var diff: Vector2
var circle_color := normal_color


func _ready():
	point = get_node("../Point")
	point_pos = point.pos

func _process(delta):
	point_pos = point.pos
	
	from = get_viewport().size/2
	update()

func _draw():
	diff = point_pos - from
	norm_pos = diff.normalized()*radius
	circle_color = trigger_color if diff.length() < radius else normal_color
	
	draw_line(from, from + norm_pos, color, 2.0, true)
	draw_circle(from, radius, circle_color)
