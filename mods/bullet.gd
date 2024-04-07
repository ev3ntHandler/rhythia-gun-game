extends Node3D

var mg = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	translate_object_local(Vector3(0,3,0))


func _on_lifetime_timeout():
	queue_free()

func sendSelf(machinegun):
	mg = machinegun




func _on_area_3d_area_entered(area):
	if area.name == "MODCollisionBullet":
		area.get_parent().get_parent().hit()
		mg.kill()
		queue_free()
