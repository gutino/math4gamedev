extends Node2D

export(Color) var normal_color := Color(1, 1, 1, 1)
export(Color) var trigger_color := Color(1, 0, 0, 1)
export(float) var tol := 0.98
export(int) var radius := 200

var from := Vector2(0, 0)
var to := Vector2(0, 0)

var cos_: float
var triggered: bool
var point: Node
var point_color: Color
var point_pos: Vector2
var norm_pos: Vector2
var arc_pos: Vector2
var arc_pos_point: Vector2
var norm_pos_point: Vector2
var line_color := normal_color


func _ready():
	point = get_node("../point")
	point_pos = point.pos
	point_color = point.color*0.2

func _process(delta):
	point_pos = point.pos
	
	from = get_viewport().size/2
	to = get_viewport().get_mouse_position()
	
	update()

func _draw():
	norm_pos = (to - from).normalized()
	norm_pos_point = (point_pos - from).normalized()
	
	arc_pos = norm_pos*radius
	arc_pos_point = norm_pos_point*radius
	
	#0.9 - 0.5 = 0.4
	
	cos_ = norm_pos.dot(norm_pos_point)
	if cos_ >= 0.5 and (tol - cos_) <= 0:
		line_color = trigger_color
	else:
		line_color = normal_color
	
	draw_line(from, from + arc_pos_point, point_color, 2.0, true)
	
	draw_line(from, from + arc_pos, line_color, 2.0, true)
	draw_circle(from, radius, Color(0, 0, 0, 0.1))
