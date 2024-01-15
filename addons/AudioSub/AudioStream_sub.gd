@tool
# and yes this is actually an audiostreamplayer node originaly
#if you didn't notice already bruh :P
extends AudioStreamPlayer

#no need for explanation this is text position
@export var text_position : Vector2 

#I was looking for a code to put a lock button to change x and y in same time
#but I couldn't find the code I would be happy if you tell me that
@export var text_scale : Vector2 = Vector2(1,1)

#This is for undertale similar text effect
#it kinda animates the text progresive
@export_range(0,1) var visible_ratio : float = 1

#by desc I meant, Description
#which contains whatever you wanna say or whatever the text would be
@export_multiline var desc : String
# Called when the node enters the scene tree for the first time.
func _ready():
# by labeltx I mean, label's text
	# when the scene runs audioSub will have a child
# audiosub will have a child of a label node
	# which is used to show and display the text
	var labeltx = Label.new()
	labeltx.name = "Labeltx"
	add_child(labeltx, true)
# NOTE: you can switch it to rich text label if you want to but I like it simple
# idk if it make an error or something I just tested with label node


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#for every labels in child of the audiosub node
	#this will effect their position and scale all together
	for labels in self.get_children():
		labels.position = text_position
		labels.scale = text_scale

#if self is playing the text is visible
# and the description is equal to text
	if self.playing:
		if self.get_child_count() >= 1:
			self.get_child(0).visible = true
			self.get_child(0).text = str(self.desc)

# if it's not playing, then the visible will be false
#   aka it will be hidden
	elif self.playing == false:
		if self.get_child_count() >= 1:
			self.get_child(0).visible = false

#  gon ga ga hehe lmao :P
# you btw my name is S83gamedev
#you can find my twitter by the same name
# and I also have youtube
