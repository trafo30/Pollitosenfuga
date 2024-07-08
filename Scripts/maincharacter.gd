extends CharacterBody2D

const moveSpeed = 50
const maxSpeed = 100

const JumpHeight=-300
const up =Vector2(0,-1)
const gravity =15

@onready var sprite = $Sprite2D
@onready var animationplayer= $AnimationPlayer


func _physics_process(_delta):
	velocity.y += gravity
	var friction = false

	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = true
		animationplayer.play("walk")
		velocity.x = min(velocity.x + moveSpeed, maxSpeed)

	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = false
		animationplayer.play("walk")
		velocity.x = max(velocity.x - moveSpeed, -maxSpeed)

	else:
		animationplayer.play("idle")
		friction = true

	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			velocity.y = JumpHeight
		if friction:
			velocity.x = lerp(velocity.x, 0.0, 0.5)
	else:
		if friction:
			velocity.x = lerp(velocity.x, 0.0, 0.01)

	move_and_slide()


