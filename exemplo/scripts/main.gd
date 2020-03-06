extends Control

# idioma atual
onready var current_language = TranslationServer.get_locale()

func _ready():
	# conecta os botões de idioma
	for btn in get_tree().get_nodes_in_group("language_btn"):
		btn.connect("toggled", self, "_on_language_toggled", [btn.name])
		# marca o botão com o idioma atual
		btn.pressed = true if btn.name == current_language else false

func _on_language_toggled(button_pressed, language):
	if button_pressed:
		TranslationServer.set_locale(language)
		current_language = language
