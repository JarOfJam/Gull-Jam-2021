gui_w = 0;
gui_h = display_get_gui_height();
gui_m = 32;
menu_x = gui_w;
menu_y = gui_h - gui_m;
menu_x_target = gui_w + gui_m;
menu_speed = 25;
menu_font = fMenu;
menu_itemHeight = font_get_size(fMenu);
menu_committed = -1;
menu_control = true;

menu[1] = "Play";
menu[0] = "Quit";

menu_items = array_length_1d(menu);
menu_cursor = 1;