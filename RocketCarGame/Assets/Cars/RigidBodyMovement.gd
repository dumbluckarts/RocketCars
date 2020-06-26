extends RigidBody

const UP = Vector3.UP

# unit vectors for direction calculations
const X_VECTOR = Vector3 (1,0,0)
const Y_VECTOR = Vector3 (0,1,0)

# The maximum horizontal speed of the body
export var MAX_SPEED = 100.0
# The maximum horizontal speed of the body
export var MAX_FALL_SPEED = 100.0
# The acceleration force used for horizontal impulse calculations
export var ENGINE_POWER = 100.0
# The acceleration force used for vertical impulse calculations
export var JUMP_POWER = 100.0

var current_velocity = linear_velocity
var direction = 0

# TODO: change these to a Vector2[x,y]
func left():
	direction = -1
func right():
	direction = 1
func jump():
	direction = 2
func stop():
	direction = 0

func move():
	if (direction == -1) and (linear_velocity.x > -MAX_SPEED):
		add_central_force(X_VECTOR * ENGINE_POWER * direction)
	if (direction == 1 ) and (linear_velocity.x < MAX_SPEED):
		add_central_force(X_VECTOR * ENGINE_POWER * direction)
	if direction == 2:
		add_central_force(Y_VECTOR * JUMP_POWER)
