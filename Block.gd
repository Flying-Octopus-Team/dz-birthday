extends RigidBody2D

signal destroyed_block

onready var particle_scene = preload("res://ParticlesGrey.tscn")
onready var sprite = $Sprite

export(Texture) var broken_texture
export(Texture) var damaged_texture
export(int) var health = 4
var counter = health

func _on_RigidBody2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		var particles = particle_scene.instance()
		add_child(particles)
		particles.emit_particles()
		print(counter)
		counter = counter - 1
		if(counter == 3):
			sprite.texture = damaged_texture
		if(counter == 2):
			sprite.texture = broken_texture
		if(counter == 0):
			emit_signal("destroyed_block")
			queue_free()
