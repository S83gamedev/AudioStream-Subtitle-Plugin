@tool
# and yes this is actually an audiostreamplayer node originaly
#if you didn't notice already bruh :P
extends AudioStreamPlayer

#by desc I meant, Description
#which contains whatever you wanna say or whatever the text would be
@export_multiline var desc : String

@export_category("Label_Setting")
@export_group("pos & scale")
#no need for explanation this is text position
@export var text_position : Vector2 

#The text_scale is kinda useless maybe if you want to use it for meme or goofy ahh purposes
@export var text_scale : Vector2 = Vector2(1,1)
#
#This is the Font Size! btw you can change the number instead of 1500 to whatever you want
#1500 is the maximum that I declared for it
@export_range(0,1500) var font_size : int = 24

@export_group("Shadow and visible ratio")
#This is for undertale similar text effect
#it kinda animates the text progresive
#which doesn't work rn
#BUT Visible characters works
@export_range(-1, 3000) var visible_characters : int = -1
#@export_range(0,1) var visible_ratio : float = 1

@export var timer_enable : bool = false
@export var timer_int : float = 1

@export_color_no_alpha var shadow_color : Color
@export var Shadow_outline_size : int

@export_group("Background Text")
@export var Square_BG : bool = false
@export var Square_color : Color = Color(1,0.35,0.56,0.78)
@export var cube_z_index : int = -1
# Called when the node enters the scene tree for the first time.
func _ready():
	#this is for bug fixing in case
#	 if anyone accidently add a child and cause crash
#	for childd in get_children():
#		childd.queue_free()

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
	if self.get_children().size() >= 1:
		for label in self.get_children():
			label.position = text_position
			label.scale = text_scale
#			Im gonna kms
#if self is playing the text is visible
# and the description is equal to text
	if self.playing:
		if self.get_child_count() >= 1:
			self.get_child(0).visible = true
			self.get_child(0).text = str(self.desc)
			self.get_child(0).add_theme_font_size_override('font_size', font_size)
			self.get_child(0).add_theme_color_override('font_shadow_color', shadow_color )
			self.get_child(0).add_theme_constant_override('shadow_outline_size', Shadow_outline_size)
			self.get_child(0).visible_characters = visible_characters
#			text_position += Vector2(1,-1)

	if self.playing:
		if self.get_child_count() >= 2:
			if get_child(1).name == "squre_bag":
				self.get_child(1).visible = true
				get_child(1).size.y = get_child(0).size.y

				get_child(1).size.x = get_child(0).size.x * 1.2
				get_child(1).position = self.get_child(0).position - Vector2(font_size / 2,1)
				get_child(1).color = Square_color
				get_child(1).z_index = cube_z_index
###############
###########
# if it's not playing, then the visible will be false
#   aka it will be hidden
	elif self.playing == false:
		if self.get_child_count() >= 1:
			self.get_child(0).visible = false

	if self.playing == false:
		if self.get_child_count() >= 2:
			self.get_child(0).visible = false
			self.get_child(1).visible = false

	if Square_BG:
		Background_sub()

	if timer_enable:
		if self.playing:
			await get_tree().create_timer(timer_int).timeout
			self.playing = false


func Background_sub():
	var lbl = self.get_child(0)
	var cube = ColorRect.new()
	if self.get_children().size() < 2:
		cube.name = "squre_bag"
		add_child(cube)

	if self.get_children().size() >= 2:
		if self.playing:
			cube.visible = true
		elif self.playing == false:
#			print("fuck you")
			cube.visible = false
	

#  gon ga ga hehe lmao :P
# you btw my name is S83gamedev
#you can find my twitter by the same name
# and I also have youtube
