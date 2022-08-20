#!/usr/bin/python
import ueberzug.lib.v0 as ueberzug
import inotify.adapters

cover = "/tmp/album_cover.jpg"

def get_placement(canvas: ueberzug.Canvas) -> ueberzug.Placement:
    art = canvas.create_placement("art", x=2, y=1, scaler=ueberzug.ScalerOption.COVER.value)
    return art

def display_cover(placement: ueberzug.Placement):
    placement.path = cover
    placement.visibility = ueberzug.Visibility.VISIBLE

def main():
    i = inotify.adapters.Inotify()
    i.add_watch(cover)

    with ueberzug.Canvas() as canv:
        place = get_placement(canv)
        display_cover(place)
        for event in i.event_gen(yield_nones=False):
            (_, type_names, _, _) = event
            condition = "IN_CLOSE_WRITE" == type_names[0]
            if condition:
                display_cover(place)


if __name__ == "__main__":
    main()
