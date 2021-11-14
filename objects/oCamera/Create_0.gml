cam = view_camera[0];
follow1 = oTrev;
follow2 = oLaci;
follow3 = oLaciShotgun;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;
shake_l = 0;
shake_m = 0;
shake_r = 0;
buff = 32;
if(layer_exists("Bricks")) {
	brickLayer = layer_get_id("Bricks");
}
if(layer_exists("Windows")) {
	windowLayer = layer_get_id("Windows");
}