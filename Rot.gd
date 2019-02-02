extends Node2D

var puppet_rotation: float = 0.0

onready var _mirror = $"../RigidBody2D"

func _ready() -> void:
	pass # Replace with function body.

func _process(delta) -> void:
	update()
	puppet_rotation = _mirror.rotation
	
	var rot = lerp_angle(rotation, puppet_rotation, 0.2)
	rotation = rot


func _draw():
	draw_line(Vector2(), Vector2.DOWN.rotated(rotation) * 100, Color.blue)
	draw_line(Vector2(), Vector2.DOWN.rotated(puppet_rotation) * 100, Color.red)


func lerp_angle(a: float, b: float, t: float) -> float:
    if abs(a-b) >= PI:
        if a > b:
            a = normalize_angle(a) - 2.0 * PI
        else:
            b = normalize_angle(b) - 2.0 * PI
    return lerp(a, b, t)


func normalize_angle(x: float)  -> float:
    return fposmod(x + PI, 2.0*PI) - PI

"""
2D Angle Interpolation (shortest distance)
Parameters:
a0 = start angle
a1 = end angle
t = interpolation factor (0.0=start, 1.0=end)
Benefits:
1. Angles do NOT need to be normalized.
2. Implementation is portable, regardless of how the modulo "%" operator outputs sign (i.e. Python, Ruby, Javascript)
3. Very easy to remember.
Thanks to Trey Wilson for the closed-form solution for shortAngleDist!
"""

func short_angle_dist(a0: float,a1: float) -> float:
	var _max: float = PI * 2
	var da: float = fmod((a1 - a0), _max)
	return fmod(2 * da, _max - da)

func angle_lerp(a0: float ,a1: float ,t: float ) -> float:
	return a0 + short_angle_dist(a0,a1) * t
