# The script of the game goes in this file.

label start:
    $ time_of_day = TIMES_OF_DAY[0]
    show bg room

    show eileen happy

    "C'est le matin."

    $ time_of_day = TIMES_OF_DAY[1]
    show bg room
    "C'est l'après-midi."