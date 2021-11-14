//finds where camera goes
if(instance_exists(follow2)) {
	xTo = ((follow1.x + follow2.x) / 2);
	yTo = ((follow1.y + follow2.y) / 2);
}
else {
	xTo = ((follow1.x + follow3.x) / 2);
	yTo = ((follow1.y + follow3.y) / 2);
}

//moves camera
x += (xTo - x) / 25;
y += (yTo - y) / 25;
x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);

//cam shake
x += random_range(-shake_r, shake_r);
y += random_range(-shake_r, shake_r);
shake_r = max(0, shake_r - ((1 / shake_l) * shake_m));

camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

//parallax stuff
layer_x(brickLayer, x / 3);
layer_x(windowLayer, x / 3);