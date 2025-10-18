extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound

const WALK_SPEED: float = 100.0
const SPRINT_SPEED: float = 200.0

const JUMP_VELOCITY: float = -350.0

var direction: float = 0.0

func _physics_process(delta: float) -> void:
    update_movement(delta)
    update_animation()

func update_movement(delta: float) -> void:
    if not is_on_floor():
        velocity += get_gravity() * delta

    var is_sprinting: bool = Input.is_action_pressed("sprint")
    var current_speed: float = SPRINT_SPEED if is_sprinting else WALK_SPEED

    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = JUMP_VELOCITY
        play_sound("jump")

    direction = Input.get_axis("move_left", "move_right")
    if direction != 0:
        velocity.x = direction * current_speed
    else:
        velocity.x = 0

    move_and_slide()

func update_animation() -> void:
    if direction != 0:
        animated_sprite.flip_h = direction < 0

    if velocity.y != 0:
        animated_sprite.play("jump")
    else:
        if velocity.x != 0:
            animated_sprite.play("run")
        else:
            animated_sprite.play("idle")

func play_sound(sound_name: String) -> void:
    if sound_name == "jump":
        jump_sound.play()
