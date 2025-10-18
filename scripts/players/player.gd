extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -350.0

func _physics_process(delta: float) -> void:
    update_movement(delta)

func update_movement(delta: float) -> void:
    if not is_on_floor():
        velocity += get_gravity() * delta

    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = JUMP_VELOCITY

    var direction := Input.get_axis("move_left", "move_right")
    if direction != 0:
        velocity.x = direction * SPEED
    else:
        velocity.x = 0

    move_and_slide()
