draw_self();

if (dead) {
	shader_set(shRed);
	draw_self();
	shader_reset();
}

