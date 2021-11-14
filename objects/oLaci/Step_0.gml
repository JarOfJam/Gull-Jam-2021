//checks for keyboard inputs
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);

//translates input into move speed
var move = right - left;
hsp = move * walksp;
vsp = vsp + grv;

//enemy collision
if(place_meeting(x + hsp, y, oKnight)) {
	var stkn = instance_place(x + hsp, y, oKnight);
	if(stkn.stunned == 0) {
		dead = 1;
	}
}

//horizontal collision
if(place_meeting(x+hsp, y, oWall)) {
	while(!place_meeting(x+sign(hsp), y, oWall)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}

//crate movement
if(place_meeting(x+hsp, y, oCrate)) {
	var currCrate = instance_place(x+hsp, y, oCrate);
	while(!place_meeting(x+sign(hsp), y, currCrate) && (!dead)) {
		x = x + sign(hsp);
	}
	hsp = hsp / 3;
	if(place_meeting(x+(32 * sign(hsp)), y, oWall)) {
		hsp = 0;
	}
	currCrate.hsp = hsp;
	currCrate.x = currCrate.x + currCrate.hsp;
}

//ladder check
if(place_meeting(x, y, oLadder)) {
	vsp = down - up;
}

//vertical collision
if(place_meeting(x, y+vsp, oWall)) {
	while(!place_meeting(x, y+sign(vsp), oWall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}

//crate collision
if(place_meeting(x, y + vsp, oCrate)) {
	while(!place_meeting(x, y + sign(vsp), oCrate)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}

//handle death
if(dead) {
	hsp = 0;
	vsp = 0;
	screenShake(10, 10);
	if(deadF < 60) {
		deadF++;
	}
	else {
		scriptSlideTransition(TRANS_MODE.GOTO, room);
	}
}

//actual movement
x = x + hsp;
y = y + vsp;

//animation stuff
if(!place_meeting(x, y + 1, oWall) || dead) {
	sprite_index = sLaciSimple;
}
else if(hsp != 0) {
	sprite_index = sLaciWalk;
}
else sprite_index = sLaciIdle;
if(hsp != 0) {
	image_xscale = sign(hsp);
}

//checks for shotgun
if(place_meeting(x, y, oShotgun)) {
	instance_create_layer(x, y, "Players", oLaciShotgun);
	instance_destroy(oShotgun);
	instance_destroy(oLaci);
}