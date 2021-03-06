menu_x += (menu_x_target - menu_x) / menu_speed;

if(menu_control) {
	if(keyboard_check_pressed(ord("W"))) {
		menu_cursor++;
		if(menu_cursor >= menu_items) {
			menu_cursor = 0;
		}
	}
	if(keyboard_check_pressed(ord("S"))) {
		menu_cursor--;
		if(menu_cursor < 0) {
			menu_cursor = menu_items - 1;
		}
	}
	if(keyboard_check_pressed(vk_space)) {
		menu_x_target = gui_w - 200;
		menu_committed = menu_cursor;
		screenShake(4,10);
		menu_control = false;
	}
}

if(menu_x < gui_w) && (menu_committed != -1) {
	switch(menu_committed) {
		case 1:
			scriptSlideTransition(TRANS_MODE.NEXT);
			break;
		case 0:
			game_end();
			break;
	}
}