@tool
extends EditorPlugin

#I understood these part thanks to cgpoint tutorial

func _enter_tree():
	# Initialization of the plugin goes here.
	add_custom_type("AudioStream_Sub", "AudioStreamPlayer", preload('res://addons/AudioSub/AudioStream_sub.gd'), preload('res://AudioSub_icon.svg'))

func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_custom_type("AudioStream_Sub")
	pass
