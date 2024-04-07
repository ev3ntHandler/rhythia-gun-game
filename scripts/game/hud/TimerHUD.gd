extends HUDItem
class_name TimerHUD

var sync_manager:SyncManager
var song_name:String
var skippable:bool

func _process(_delta):
	if !sync_manager: return
	$Song.text = song_name
	var current_time = maxf(sync_manager.current_time,0)
	var length = sync_manager.length
	if skippable: $Timer.text = "PRESS SPACE TO SKIP"
	else: $Timer.text = "%s:%02d / %s:%02d" % [
		floori(current_time/60),
		floori(int(current_time)%60),
		floori(length/60),
		floori(int(length)%60)
	]
	$Progress/Bar.value = current_time / length
