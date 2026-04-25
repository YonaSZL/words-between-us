init 2 python:
    from renpy.display.layout import DynamicDisplayable
    from renpy.display.im import Image    

    def make_dynamic_bg(bg_name):
        def dynamic_bg(st, at):
            tod = renpy.store.time_of_day
            path = f"{store.BACKGROUNDS_PATH}{bg_name}/{bg_name}_{tod}.jpg"
            return Image(path), None
        return dynamic_bg

    for _bg in store.BACKGROUNDS_NAMES:
        renpy.image(f"bg {_bg}", DynamicDisplayable(make_dynamic_bg(_bg)))
