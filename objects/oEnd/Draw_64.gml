if(mode != TRANS_MODE.OFF) {
	draw_set_color(c_black);
	draw_rectangle(0, 0, percent * w_half, h, false);
	draw_rectangle(w, 0, w - (percent * w_half), h, false);
}