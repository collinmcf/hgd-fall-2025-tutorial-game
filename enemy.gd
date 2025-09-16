extends Node2D

@export var speed = 200
var screen_size
var rng = RandomNumberGenerator.new()

func _ready():
	screen_size = get_viewport_rect().size
	var random_x = rng.randf_range(screen_size.x * 0.05, screen_size.x * 0.95)
	position = Vector2(random_x, screen_size.y * 0.05)

func _random_position():
	var random_x = rng.randf_range(screen_size.x * 0.05, screen_size.x * 0.95)
	position = Vector2(random_x, screen_size.x * 0.05)
