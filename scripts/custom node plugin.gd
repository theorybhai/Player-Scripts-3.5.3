# res://addons/my_custom_character/custom_node_plugin.gd
tool
extends EditorPlugin

func _enter_tree():
	# Registers the custom node when the plugin is enabled
	add_custom_type(
		"PlayerCharacter", 
		"KinematicBody2D", 
		preload("PlayerCharacter.gd"), 
		preload("icon.png")
	)

func _exit_tree():
	# Cleans up the custom node when the plugin is disabled
	remove_custom_type("PlayerCharacter")
