extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction:
		velocity.x = direction * SPEED
		flip_sprite(get_node("PlayerSprite"), direction)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	#if isOnSlope and DownButton is pressed then 
	#	get the direction the player is facing and make hi mmove
	if Input.is_action_just_pressed("move_down"):
		velocity.x = direction * SPEED
	
	
	move_and_slide()
	
func flip_sprite(sprite: Sprite2D, direction: int) -> void:
	if(direction == 1 and not sprite.flip_h):
		return
	if(direction == -1 and sprite.flip_h):
		return
	sprite.flip_h = !sprite.flip_h
	return
