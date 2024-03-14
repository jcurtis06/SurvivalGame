extends DynamicBlock

@export var full_grown_texture: Texture

@onready var sprite := $Sprite
@onready var timer := $Timer

func place():
	timer.start()

func _on_timer_timeout() -> void:
	sprite.texture = full_grown_texture
