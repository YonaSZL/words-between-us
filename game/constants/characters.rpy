init 2 python:
    import os

    base = renpy.config.gamedir + "/" + store.CHARACTERS_PATH

    for character_folder in os.listdir(base):

        char_path = base + character_folder + "/"

        for file in os.listdir(char_path):

            expression = os.path.splitext(file)[0]
            image_name = f"{character_folder} {expression}"

            file_path = char_path + file
            file_path = file_path.replace("\\", "/")

            renpy.image(image_name, file_path)