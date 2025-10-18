extends Node2D

@onready var background: Parallax2D = $Background
@onready var ground: TileMapLayer = $Ground

@onready var player_camera: Camera2D = $Player/Camera2D

func _ready() -> void:
	add_to_group("level")
	set_camera_limits()

func set_camera_limits() -> void:
	var background_sprite: Sprite2D = background.get_child(0) as Sprite2D
	var background_size: Vector2 = background_sprite.texture.get_size() * background_sprite.scale

	var right_bottom: Vector2 = ground.get_used_rect().end
	var tile_size: Vector2 = ground.tile_set.tile_size

	player_camera.limit_top = 0
	player_camera.limit_left = 0

	var max_x: float = max(background_size.x, right_bottom.x * tile_size.x)
	var max_y: float = max(background_size.y, right_bottom.y * tile_size.y)

	player_camera.limit_bottom = int(max_y)
	player_camera.limit_right = int(max_x)
