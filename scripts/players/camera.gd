extends Camera2D

func _ready() -> void:
    set_camera_zoom()
    get_viewport().size_changed.connect(set_camera_zoom)

func set_camera_zoom() -> void:
    var base_resolution_x: float = ProjectSettings.get_setting("display/window/size/viewport_width")
    var base_resolution_y: float = ProjectSettings.get_setting("display/window/size/viewport_height")

    var viewport_size: Vector2 = get_viewport_rect().size

    var resolution_ratio_x: float = viewport_size.x / base_resolution_x
    var resolution_ratio_y: float = viewport_size.y / base_resolution_y

    var min_zoom_scale: float = min(resolution_ratio_x, resolution_ratio_y)
    zoom = Vector2(min_zoom_scale, min_zoom_scale)