extends CPUParticles2D

onready var timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func emit_particles():
	timer.start()
	emitting = true


func _on_Timer_timeout():
	queue_free()
