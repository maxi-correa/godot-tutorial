extends Node2D

@export var area_2d: Area2D
@export var reproductor: AudioStreamPlayer2D

var contenedor_monedas: ContenedorMonedas

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_2d.body_entered.connect(_recogida)
	_iniciar_animacion()

func _recogida(_body):
	reproductor.reparent(get_parent().get_parent().get_parent())
	reproductor.play()
	contenedor_monedas.moneda_recogida()
	queue_free()

func _iniciar_animacion():
	var tween: Tween = create_tween()
	tween.set_loops(0) #El valor 0 indica infinitos loops
	#Para subir:
	tween.tween_property(self, "position:y", position.y - 7, 0.5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	#Para bajar y volver a posición original:
	tween.tween_property(self, "position:y", position.y, 0.5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
