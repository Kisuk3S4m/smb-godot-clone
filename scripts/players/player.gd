extends CharacterBody2D

const SPEED = 200.0

func _physics_process(_delta: float) -> void:
    var direction := Input.get_axis("move_left", "move_right")
    if direction != 0:
        velocity.x = direction * SPEED
    else:
        velocity.x = 0

    move_and_slide()
