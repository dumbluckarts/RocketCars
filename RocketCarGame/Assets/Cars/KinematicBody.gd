extends KinematicBody

const UP = Vector3.UP


export var move_speed = 5.0
export var max_speed = 15.0
export var jump_speed = 10.0

export var max_fall_speed = 10
export var max_boost_speed = 20

export var gravity = 10.0
export var drag = 0.5

export var brake = 1.0
export var boost = 10

var current_velocity = Vector3.ZERO

func _physics_process(delta):
	control()
	move()
	_gravity()
	_drag()

func control():
	if Input.is_action_pressed("forward"):
		if (current_velocity.x < max_speed):
			_add_velocity(move_speed)
	
	if Input.is_action_pressed("backward"):
		if (current_velocity.x > -max_speed):
			_add_velocity(-move_speed)
	
	if Input.is_action_pressed("ccw"):
		pass
	
	if Input.is_action_pressed("cw"):
		pass
	
	if Input.is_action_pressed("boost"):
		_boost()
	
	if Input.is_action_pressed("brake"):
		_brake()
	
	if Input.is_action_just_pressed("jump"):
		_jump()


func _add_velocity(velocity):
	current_velocity.x += velocity


func move():
	move_and_slide(current_velocity, UP)


func _rotate():
	pass


func _boost():
	if (current_velocity.x < 0 ): return
	elif (current_velocity.x > max_boost_speed ): return
	current_velocity.x += boost


func _brake():
	if (current_velocity.x > 0):
		current_velocity.x -= brake
	elif (current_velocity.x < 0):
		current_velocity.x += brake
	else:
		current_velocity.x = 0


func _drag():
	if (current_velocity.x > 0):
		current_velocity.x -= drag
	elif (current_velocity.x < 0):
		current_velocity.x += drag


func _jump():
	current_velocity.y = jump_speed


func _gravity():
	if (current_velocity.y < max_fall_speed ): return
	if (current_velocity.y >= 0):
		current_velocity.y -= gravity
