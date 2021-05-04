extends Area2D

var move : bool = false

onready var animationPlayer : AnimationPlayer = $AnimationPlayer
onready var sprite : Sprite = $Sprite

export(int) var SPEED : int = 50

func _process(delta: float) -> void:
	move = false
	if Input.is_action_pressed("ui_right"):
		move(SPEED, 0, delta)
		sprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		move(-SPEED, 0, delta)
		sprite.flip_h = true
	if Input.is_action_pressed("ui_up"):
		move(0, -SPEED,delta)
	if Input.is_action_pressed("ui_down"):
		move(0, SPEED, delta)
	
	if move == true:
		animationPlayer.play("Run")
	else:
		animationPlayer.play("Idle")	

func move(xspeed, yspeed, delta : float) -> void:
	position.x += xspeed * delta
	position.y += yspeed * delta
	move = true


func _on_Pig_area_entered(area : Area2D) -> void:
	area.queue_free()
	scale *= 1.1
	if SPEED == 0:
		SPEED = 1
	else:
		SPEED -= 3
