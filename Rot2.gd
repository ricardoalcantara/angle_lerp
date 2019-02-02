extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta) -> void:
	update()
	if Input.is_action_pressed("ui_left"):
		angular_velocity = -5.0
	
	if Input.is_action_pressed("ui_right"):
		angular_velocity = 5.0
		
	print(rotation)
