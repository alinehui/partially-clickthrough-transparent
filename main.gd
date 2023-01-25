extends Node2D

var pet_sprite : Sprite2D = $Icon

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set bg transparent.
	get_tree().get_root().set_transparent_background(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_passthrough(pet_sprite)

func set_passthrough(sprite: Sprite2D):
	var texture_center: Vector2 = sprite.texture.get_size() / 2
	var texture_corners: PackedVector2Array = [
		sprite.global_position + texture_center * Vector2(-1, -1), # Top left corner
		sprite.global_position + texture_center * Vector2(1, -1), # Top right corner
		sprite.global_position + texture_center * Vector2(1 , 1), # Bottom right corner
		sprite.global_position + texture_center * Vector2(-1 ,1) # Bottom left corner
	]

	DisplayServer.window_set_mouse_passthrough(texture_corners)
