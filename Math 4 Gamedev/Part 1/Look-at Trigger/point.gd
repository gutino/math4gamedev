extends Node2D

export(Color) var color := Color(0, 0, 1, 1)
export(float) var secs := 2

var from := Vector2(0, 0)
var pos: Vector2

var point_size := 10.0
var radius: float
var rand_x: float
var rand_y: float
var timer
var rng = RandomNumberGenerator.new()

func _ready():
	radius = get_node("../trigger").radius
	
	timer = get_node("../Timer")
	timer.set_wait_time(secs)
	timer.connect("timeout", self, "_on_Timer_timeout")
	
	rng.randomize()
	
	randomize_point()

func _process(delta):
	from = get_viewport().size/2
	
	update()

func _draw():
	draw_circle(pos, point_size, color)
	
func _on_Timer_timeout():
	randomize_point()

func randomize_point():
	rand_x = rng.randf_range(point_size/2, get_viewport().size.x - point_size/2)
	rand_y = rng.randf_range(point_size/2, get_viewport().size.y - point_size/2)
	
	pos = Vector2(rand_x, rand_y)
	
	if (pos - from).length() < radius:
		randomize_point()
