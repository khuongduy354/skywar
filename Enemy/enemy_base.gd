extends CharacterBody2D
var player:Player = null
func _physics_process(delta):
	if player: 
		look_at(player.global_position)

func _on_detect_player_body_entered(body):
	if body is Player: 
		player = body
