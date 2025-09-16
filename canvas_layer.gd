extends CanvasLayer

func _update_health(health):
	$Label3.text = str(health)
	
func _update_coins(coins):
	$Label4.text = str(10 - coins)
	
func _show_win_or_lose(win):
	$Label.hide()
	$Label2.hide()
	$Label3.hide()
	$Label4.hide()
	
	if win:
		$Label5.show()
	else:
		$Label6.show()
	
	$Button.show()

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
