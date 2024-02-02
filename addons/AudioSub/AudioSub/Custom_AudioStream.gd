@tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("AudioStream_Sub", "AudioStreamPlayer", preload('res://addons/AudioSub/AudioStream_sub.gd'), preload('res://addons/AudioSub/AudioSub_small_icon.svg'))
	pass


func _exit_tree():
	remove_custom_type("AudioStream_Sub")
	pass
