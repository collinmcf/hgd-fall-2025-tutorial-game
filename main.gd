extends Node

var player
var enemy
var hud
var projectile = load("res://projectile.tscn")

func _ready():
	player = $Area2D
	enemy = $Node2D
	hud = $CanvasLayer

func _process(delta):
	hud._update_health(player.health)
	hud._update_coins(player.coins)

func _on_timer_timeout() -> void:
	enemy._random_position()
	var new_proj = projectile.instantiate()
	new_proj.position = enemy.position
	add_child(new_proj)

func _on_area_2d_lose() -> void:
	$Timer2.start()
	
func _on_area_2d_win() -> void:
	enemy.hide()
	$Area2D2.hide()
	for child in self.get_children():
		if child.name.begins_with("@Area2D"):
			child.queue_free()
	
	$Timer3.start()

func _on_timer_2_timeout() -> void:
	hud._show_win_or_lose(false)
	get_tree().paused = true

func _on_timer_3_timeout() -> void:
	for child in self.get_children():
		if child.name.begins_with("@Area2D"):
			child.queue_free()
	
	hud._show_win_or_lose(true)
	get_tree().paused = true
