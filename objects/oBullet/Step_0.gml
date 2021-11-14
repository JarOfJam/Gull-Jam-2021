//wall collision
if(place_meeting(x+hsp, y, oWall)) {
	instance_destroy();
}

//trev collision
if(place_meeting(x+hsp, y, oTrev)) {
	with(oTrev) {
		dead = 1;
	}
	instance_destroy();
}

//knight collision
if(place_meeting(x+hsp, y, oKnight)) {
	var shot = instance_place(x+hsp, y, oKnight);
	if(shot.stunned > 0) {
		instance_destroy(shot);
		screenShake(5, 10);
	}
	instance_destroy();
}

x = x + (shtsp * dir);