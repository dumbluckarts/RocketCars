extends "res://Assets/Cars/Movement.gd"

func _physics_process(delta):
	grav(delta)
	control()
	move()


func control():
	if Input.is_action_pressed("forward") and not Input.is_action_pressed("backward"):
		right(false)
		
	elif Input.is_action_pressed("backward") and not Input.is_action_pressed("forward"):
		left(false)
		
	else: 
		stop()
		
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump()
