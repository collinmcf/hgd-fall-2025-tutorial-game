extends Area2D

signal lose
signal win

@export var speed = 100
@export var health = 5
@export var coins = 0
var screen_size
var player_size = Vector2(100, 100)

func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x / 2, screen_size.y * 0.9);

func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		velocity.x += speed
		$Sprite2D.flip_h = true
	if Input.is_action_pressed("left"):
		velocity.x -= speed
		$Sprite2D.flip_h = false
	if Input.is_action_pressed("down"):
		velocity.y += speed
	if Input.is_action_pressed("up"):
		velocity.y -= speed
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO + player_size / 2, screen_size - player_size / 2)

func _on_area_entered(_area):
	if _area.name.begins_with("@Area2D"):
		health -= 1
		print(health)
		
		if health < 1:
			hide()
			lose.emit()
			# get_tree().reload_current_scene()
	
	if _area.name == "Area2D2":
		coins += 1
		print("You have ", coins, " coins")
		
		if coins >= 10:
			win.emit()
