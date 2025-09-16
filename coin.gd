extends Area2D

var screen_size
var rng = RandomNumberGenerator.new()

func _ready():
	screen_size = get_viewport_rect().size
	var random_x = rng.randf_range(screen_size.x * 0.05, screen_size.x * 0.95)
	var random_y = rng.randf_range(screen_size.y * 0.25, screen_size.y * 0.95)
	position = Vector2(random_x, random_y)

func _on_area_entered(area: Area2D) -> void:
	
	if !area.name.begins_with("@"):
		var random_x = rng.randf_range(screen_size.x * 0.05, screen_size.x * 0.95)
		var random_y = rng.randf_range(screen_size.y * 0.25, screen_size.y * 0.95)
		position = Vector2(random_x, random_y)
