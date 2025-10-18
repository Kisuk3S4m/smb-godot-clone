extends Node2D

@onready var background: Parallax2D = $Background
@onready var player_camera: Camera2D = $Player/Camera2D

func _ready() -> void:
    add_to_group("level")
    set_camera_limits()

func set_camera_limits() -> void:
    var background_sprite: Sprite2D = background.get_child(0) as Sprite2D
    var background_size: Vector2 = background_sprite.texture.get_size() * background_sprite.scale
    
    player_camera.limit_top = 0
    player_camera.limit_left = 0

    player_camera.limit_bottom = int(background_size.y)
    player_camera.limit_right = int(background_size.x)
