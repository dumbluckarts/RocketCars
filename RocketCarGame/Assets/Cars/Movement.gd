extends KinematicBody

const UP = Vector3.UP

export var SPEED = 100.0
export var GRAVITY = 100.0
export var JUMP_SPEED = 100.0
export var DRAG = 100.0

export var MAX_SPEED = 100.0
export var MAX_FALL_SPEED = 100.0

var velocity = Vector3.ZERO
var direction = 0

func left(reset):
	direction = -1
	if reset:
		velocity.x = 0
	
func right(reset):
	direction = 1
	if reset:
		velocity.x = 0

func stop():
	direction = 0


func move():
	if velocity.x < MAX_SPEED:
		velocity.x += SPEED
	else:
		velocity.x = MAX_SPEED
#	if velocity.x > 0:
#		drag()
	if direction == 0:
		drag()
	var new_velocity = Vector3(velocity.x * direction, velocity.y, 0)
	move_and_slide(new_velocity, UP)

func jump():
	velocity.y = JUMP_SPEED

func grav(delta):
	if velocity.y > MAX_FALL_SPEED: return
	velocity.y -= GRAVITY

func drag():
	velocity.x -= lerp(velocity.x, 0.0, DRAG)
#	print("before " + str(velocity.x))
#	if velocity.x <= 0: return
#	velocity.x -= DRAG
#	print("after " + str(velocity.x))
