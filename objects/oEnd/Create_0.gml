w = display_get_gui_width();
h = display_get_gui_height();
w_half = w / 2;
enum TRANS_MODE {
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

mode = TRANS_MODE.INTRO;
percent = 1;
target = room;