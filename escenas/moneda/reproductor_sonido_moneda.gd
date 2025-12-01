extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	finished.connect(_eliminar) #Elimina los reproductores que se creen en la Escena Principal


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _eliminar():
	queue_free()
