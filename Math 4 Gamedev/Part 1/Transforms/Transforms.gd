#tool
extends Node2D

var scale_fac := 100

var obj_x: Vector2
var obj_y: Vector2
var local: Vector2
var obj_origin: Vector2
var point_origin: Vector2

onready var object = get_node("object")
onready var point = get_node("point")


func _process(delta):
	obj_origin = object.transform.origin
	point_origin = point.transform.origin

	obj_x = object.transform.orthonormalized().x
	obj_y = object.transform.orthonormalized().y
	
	local = Vector2(
		obj_x.dot(point.transform.origin), 
		obj_y.dot(point.transform.origin)
	)
	
	update()

func _draw():
	draw_line(Vector2(0,0), point_origin, Color(1,1,1,1))
	draw_circle(point_origin, 5.0, Color(1,1,1,1))
	
	#draw gizmos
	draw_line(obj_origin, (obj_origin + obj_x*scale_fac), Color(1,0,0,1))
	draw_line(obj_origin, (obj_origin + obj_y*scale_fac), Color(0,1,0,1))
	
	draw_line(obj_origin, obj_origin + local, Color(1,1,1,1), 3.0)
	draw_circle(obj_origin, 5.0, Color(0,0,0,1))
