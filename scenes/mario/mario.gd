class_name Mario extends CharacterBody2D

# Così espongo le variabili all'editor e posso settarle esternamente (click sul nodo a cui ho assegnato lo script e mi si apre nell'inspector a destra)
@export var move_config : MoveResource # Sto prendendo i dati da una sorta di file di configurazione che ho settato esternamente
@export var animation_controller: AnimatedSprite2D
@export var audio_controller: AudioStreamPlayer2D

var gravity = 980

# viene chiamata 60 volte al secondo, attenti a cosa ci mettete qui
func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("left", "right") # queste stringhe sono mappate nell'input mapper (lo trovate nelle impostazioni progetto)
	if direction != 0:
		animation_controller.flip_h = direction < 0
	velocity.x = direction * move_config.speed
	print("VELOCITY X: " +str(velocity.x))
	
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if is_on_floor() && Input.is_action_pressed("jump"):
		velocity.y = -move_config.jump_speed
		audio_controller.play()
	
	move_and_slide() # Sto dicendo a Godot: dopo che hai fatto tutte le operazioni e assegnazioni, applicale al "mondo fisico". Se lasciate il mouse sopra ai metodi vi viene fuori la documentazione, ma potete fare anche ctrl + click sul metodo
