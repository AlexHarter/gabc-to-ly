example_gabc_file_path = "example.gabc"
with open(example_gabc_file_path, 'r') as file:
    gabc = file.read()

print(f"Full GABC: {gabc}")

gabc_header = gabc.split("%%")[0]
gabc_body = gabc.split("%%")[1]

print(f"GABC Header: {gabc_header}")
print(f"GABC Body: {gabc_body}")

def parse_gabc_header(gabc_header):
  gabc_header_entries = gabc_header.strip().split(";\n")
  gabc_header_dictionary = {}
  for entry in gabc_header_entries:
      key, value = entry.split(":", 1) # in case there are semicolons in the value
      gabc_header_dictionary.update({key.strip(): value.strip()})
    ly_metadata = []
for key, value in gabc_header_dictionary.items():
    ly_metadata.append(f"{key} = {value}")
print(f"LilyPond Metadata: {ly_metadata}")

"""
class LyNote:
    def __init__(self, pitch_class, accidental="", octave, duration, special_neume="", liquescence=""):
        self.pitch_class = pitch_class
        self.accidental = accidental
        self.octave = octave
        self.duration = duration
        self.special_neume = special_neume
        self.liquescence = liquescence

    def __str__(self):
        f"{self.pitch_class}{self.accidental}{self.octave}{self.duration}{self.special_neume}{self.liquescence}"
"""

gabc_positions_with_position_ints = {
    "a": 0,
    "b": 1,
    "c": 2,
    "d": 3,
    "e": 4,
    "f": 5,
    "g": 6,
    "h": 7,
    "i": 8,
    "j": 9,
    "k": 10,
    "l": 11,
    "m": 12
}
gabc_positions = gabc_positions_with_position_ints.keys()
clefs_with_position_int_of_do = {
    "c1": 3,
    "c2": 5,
    "c3": 7,
    "c4": 9,
    "f1": 0,
    "f2": 2,
    "f3": 4,
    "f4": 6
}
clefs = clefs_with_position_int_of_do.keys()
distance_from_do_with_ly_pitch_classes = {
    -9: "a",
    -8: "b",
    -7: "c",
    -6: "d",
    -5: "e",
    -4: "f",
    -3: "g",
    -2: "a",
    -1: "b",
     0: "c",
     1: "d",
     2: "e",
     3: "f",
     4: "g",
     5: "a",
     6: "b"
}

gabc_accidentals_with_ly_accidentals = {
    "y":"",   # natural
    "x":"es", # flat
    "#":"is"  # sharp
}
gabc_accidentals = gabc_accidentals_with_ly_accidentals.keys()

absolute_octaves_with_ly_octaves = {
    3:",",
    4:"",
    5:"'"
}
absolute_octaves = absolute_octaves_with_ly_octaves.keys()

proportionalism_rhythms = (
      "16", # sixteenth
      "8",  # eighth
      "4",  # quarter
      "4.", # dotted quarter
      "2"   # half
  )
gabc_duration_symbols = (
    "_", # long - quarter note if by itself
    ".", # extra long - could be dotted quarter or half depending on context
    "W", # quilisma - 
    "r"
)

special_neumes = (
    "w", # quilisma
    "o", # oriscus
    "-"  # initio debilis
)

liquescence = (
    "~", # diminutive # in lilypond:  \tweak #'font-size #-3
    "<", # augmentative ascending
    ">"  # augmentative descending
)

def gabc_position_to_ly_pitch_class(clef, gabc_position): # keep this method
    distance_from_do = gabc_positions_with_position_ints[gabc_position] - clefs_with_position_int_of_do[clef]
    ly_pitch_class = distance_from_do_with_ly_pitch_classes[distance_from_do]
    return ly_pitch_class

ly_melody = ""
ly_lyrics = ""
parsing_mode = "melody"
active_accidentals = "natural"
melisma_index = 0
for i, c in enumerate(gabc_body):
    gabc_body = gabc_body.strip()

    # we expect the clef to be defined first
    if i == 0:
	if c == "(":
	    if gabc_body[i+1:i+3] in clefs and gabc_body[i+3] == ")":
		clef = gabc_body[i+1:i+3]
		i += 4
	    else:
		print("clef not defined")
		return 0

    elif c == "(":
	parsing_mode = "melody"
	melisma_index += 1
	break
    elif c == ")":

	if gabc_body[i+1] == " ":
	    ly_lyrics += " "
	else:
	    ly_lyrics += " -- "

	parsing_mode = "lyrics"
	break


    if parsing_mode == "melody":
	if c in gabc_positions: # pitches
	    ly_melody += gabc_position_to_ly_pitch_class(clef, c)
	else: # modifier characters
	    match c:
		case "_": # long duration - if by itself, quarter note
		case ".": # longer duration - half note or dotted quarter note, depending on context
		case "r": # if one, sixteenth grace note, if two after a dotted note, two sixteenth notes
		case "o": # oriscus, upper auxiliary
		case "W": # quilisma, note before, lower auxiliary
		case "~": # diminutive liquescence
		case "<": # ascending augmentative liquescence
		case ">": # descending augmentative liquescence
		case other:
		    # add eighth note rhythm
		    break


	ly_melody += gabc_position_to_ly_pitch_class(c)

    elif parsing_mode == "lyrics":
	ly_lyrics += c

print(f"LilyPond Melody: {ly_melody}")
print(f"LilyPond Lyrics: {ly_lyrics}")

with open("template.ly", "r") as file:
    ly_template = file.read()

ly_template_interpolated = ly_template
ly_template_interpolated = ly_template_interpolated.replace("% ly_metadeta", ''.join(ly_metadata))
ly_template_interpolated = ly_template_interpolated.replace("% ly_melody", ly_melody)
ly_template_interpolated = ly_template_interpolated.replace("% ly_lyrics", ly_lyrics)

with open("chant.ly", "w") as file:
    file.write(ly_template_interpolated)

# tangled from Org-Mode on <2024-06-28>
