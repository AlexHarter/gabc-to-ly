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

with open("template.ly", "r") as file:
    ly_template = file.read()

ly_template_interpolated = ly_template
ly_template_interpolated = ly_template_interpolated.replace("% ly_metadeta", ''.join(ly_metadata))
ly_template_interpolated = ly_template_interpolated.replace("% ly_melody", ly_melody)
ly_template_interpolated = ly_template_interpolated.replace("% ly_lyrics", ly_lyrics)

with open("chant.ly", "w") as file:
    file.write(ly_template_interpolated)

# tangled from Org-Mode on <#DATE>
