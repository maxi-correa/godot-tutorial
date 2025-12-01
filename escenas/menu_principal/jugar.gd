extends Button

@export var escena_principal: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !pressed.is_connected(_jugar):
		pressed.connect(_jugar)

#Otra opción es "pressed.connect(_jugar, 4), en vez del if
#Con el 4 indicamos que la señal se emite una vez y luego se desconecta automáticamente

func _jugar():
	get_tree().change_scene_to_packed(escena_principal)
