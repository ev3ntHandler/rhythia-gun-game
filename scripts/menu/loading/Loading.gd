extends Node

func _ready():
	Rhythia.connect("on_init_stage",Callable(self,"_on_init_stage"))
	Rhythia.connect("on_init_complete",Callable(self,"_finish").bind(),4)

func _on_init_stage(stage,progress=[]):
	if stage != null: $Container/Label.text = stage
	$Container/ProgressBar1.visible = false
	$Container/ProgressBar2.visible = false
	$Container/ProgressBar3.visible = false
	var i = 1
	for bar in progress:
		var node = get_node("Container/ProgressBar%s" % i)
		node.get_node("Label").text = bar.text
		var progress_bar = node.get_node("Bar")
		progress_bar.max_value = bar.max
		progress_bar.value = bar.value
		node.visible = true
		i += 1
func _finish():
	get_parent().finish()
