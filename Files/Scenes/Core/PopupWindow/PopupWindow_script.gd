@tool
class_name popup_window_vos extends window_vos

@export var has_pwd_query: bool:
	set = set_has_pwd_query
@export var pwd_input_box: LineEdit:
	set = set_pwd_input_box
@export var popup_text_label: Label

@onready var incorrect_message: HBoxContainer = %IncorrectMsg
@onready var timer: Timer = $OtherComponents/Timer

func _process(delta: float) -> void:
	self.position = Vector2(Core.viewport_size.x/2 - self.size.x/2, Core.viewport_size.y/2 - self.size.y/2)

func set_pwd_input_box(value):
	pwd_input_box = value
	pwd_input_box.connect("text_submitted", verify)

func set_has_pwd_query(value):
	has_pwd_query = value
	if has_pwd_query:
		pwd_input_box.show()
	else:
		pwd_input_box.hide()

func verify(user_input: String):
	match user_input:
		"cubigor":
			Core.stop_event()
			Core.start_event(
				Core.crt_shader_uid,
				Core.default_background_uid, "res://Files/audio/Cubigor theme.mp3",
				Color("1b2130"),
				true,
				"uid://dtbj512t62f8w"
			)

		"forgeworks":
			Core.stop_event()
			Core.start_event()

		"nightcity":
			Core.stop_event()
			Core.start_event()

		"the silent remains":
			Core.stop_event()
			Core.start_event(
				"res://Files/shaders/vignette.tres",
				"res://Files/sprites/belathazar.png",
				"res://Files/audio/morse.wav"
			)

		"labobarco":
			Core.stop_event()
			Core.play_secondary_track("res://Files/audio/Building_Stuff.mp3")

		"deziangle":
			Core.stop_event()
			Core.start_event(
				"uid://c0b4chdbht0uq",
				Core.default_background_uid,
				"uid://csb34xtadckwo",
				Color(0.879, 0.001, 0.856),
				true,
				"uid://b5x7yby3d60p2"
			)
			Core.spawn_popup("The end is near", "THY END IS NOWS")

		"fuck":
			Core.stop_event()

		"no u":
			Core.stop_event()

		"bitch":
			Core.stop_event()

		_:
			incorrect_message.visible = true
			timer.start()
			pwd_input_box.text = ""
			audioplayer.play()

func _on_timer_timeout() -> void:
	incorrect_message.hide()
