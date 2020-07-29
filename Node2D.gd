extends Node2D

var block_count : int
onready var label = $CanvasLayer/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	block_count = $Blocks.get_child_count()
	for block in $Blocks.get_children():
		block.connect("destroyed_block", self, "decrease_block_count")
	call_deferred("update_label")

func decrease_block_count():
	block_count = block_count - 1;
	if(block_count == 0):
		$yay.play()
		for block in $Confetti.get_children():
			block.emitting = true
	update_label()
	
func update_label():
	label.text = String(block_count)
