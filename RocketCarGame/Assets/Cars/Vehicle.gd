extends "res://Assets/Cars/RigidBodyMovement.gd"

func _process(delta):
	
	control()
	


func control():
	if Input.is_action_pressed("forward") and not Input.is_action_pressed("backward"):
		right()
		
	elif Input.is_action_pressed("backward") and not Input.is_action_pressed("forward"):
		left()
		
	if Input.is_action_just_pressed("jump"):
		jump()
		
	
	move()
	stop()
