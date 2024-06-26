## This class is NOT meant to be used by end users
@tool
class_name CameraPropertySetter
extends Resource


# FP stands for Fake Private.
# This means that this variable is accessed from outside this script,
# but should be hidden from the end user.


var properties := CameraProperties.new()
var camera: ModularCamera


var _output_properties := CameraProperties.new() # FP
var _started: bool = false # FP


func _base_start(starting_camera: ModularCamera): # FP
	if _started:
		ModularCameraUtils.print_detailed_err("Trying to start behaviour/modifier, but it has aredy been started.")
		return
	_started = true
	camera = starting_camera
	_start()


func _base_stop(): # FP
	if not _started:
		ModularCameraUtils.print_detailed_err("Trying to stop behaviour/modifier, but it is already stopped.")
		return
	_started = false
	_stop()


func _base_base_process(delta: float): # FP
	if not _started:
		ModularCameraUtils.print_detailed_err("Trying to process behaviour/modifier, but it is stopped. _started will be set to true.")
		_started = true
	_base_process(delta)


func _start():
	pass


func _stop():
	pass


func _base_process(delta: float):
	pass


func _process(delta: float):
	pass
