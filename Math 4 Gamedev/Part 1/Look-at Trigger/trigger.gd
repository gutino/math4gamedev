extends Node2D

export(Color) var normal_color := Color(1, 1, 1, 1)
export(Color) var trigger_color := Color(1, 0, 0, 1)
export(float) var tol := 0.5
export(int) var radius := 200

var from := Vector2(0, 0)
var to := Vector2(0, 0)

var point: Node
var point_pos: Vector2
var norm_pos: Vector2
var diff: Vector2
var line_color := normal_color


func _ready():
	point = get_node("../point")
	point_pos = point.pos

func _process(delta):
	point_pos = point.pos
	
	from = get_viewport().size/2
	to = get_viewport().get_mouse_position()
	
	update()

func _draw():
	diff = to - from
	norm_pos = diff.normalized()*radius
	
	draw_line(from, from + norm_pos, line_color, 2.0, true)
	draw_circle(from, radius, Color(0, 0, 0, 0.1))
