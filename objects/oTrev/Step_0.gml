//checks for keyboard inputs
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
jump = keyboard_check_pressed(vk_space);
press = keyboard_check_pressed(ord("E"));

//translates input into move speed
var move = right - left;
hsp = move * walksp;
vsp = vsp + grv;
if((place_meeting(x, y + 1, oWall)) || (place_meeting(x, y + 1, oCrate)) || (place_meeting(x, y + 1, oLaci)) || (place_meeting(x, y + 1, oLaciShotgun))) {
	jumpT = 7;
}
else {
	jumpT--;
}
if((jumpT > 0) && jump) {
	vsp = -7;
}

//stun enemies
if(place_meeting(x, y + 1, oKnight)) {
	var stkn = instance_place(x, y + 1, oKnight);
	stkn.stunned = 120;
	vsp = -7;
}

//enemy collision
if(place_meeting(x + hsp, y, oKnight)) {
	var stkn = instance_place(x + hsp, y, oKnight);
	if(stkn.stunned == 0) {
		dead = 1;
	}
}

//trev on top of laci
if(place_meeting(x, y + 1, oLaci)) && (move == 0) && (!jump) {
	hsp = oLaci.hsp;
	vsp = 0;
}
if(place_meeting(x, y + 1, oLaciShotgun)) && (move == 0) && (!jump) {
	hsp = oLaciShotgun.hsp;
	vsp = 0;
}

//horizontal collision
if(place_meeting(x + hsp, y, oWall)) {
	while(!place_meeting(x + sign(hsp), y, oWall)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}

//ladder check
if(place_meeting(x, y, oLadder)) {
	vsp = down - up;
}

//vertical collision
if(place_meeting(x, y + vsp, oWall)) {
	while(!place_meeting(x, y + sign(vsp), oWall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}

//crate collision
if(place_meeting(x + hsp, y, oCrate)) {
	while(!place_meeting(x + sign(hsp), y, oCrate)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}
if(place_meeting(x, y + vsp, oCrate)) {
	while(!place_meeting(x, y + sign(vsp), oCrate)) {
		y = y + sign(vsp);
	}
	vsp = 0;
	hsp = hsp + oCrate.hsp;
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

//button presses
if(press) {
	if(place_meeting(x, y, oButton)) {
		var currButton = instance_place(x, y, oButton);
		instance_create_layer(currButton.x, currButton.y, "Buttons", oButtonPressed);
		instance_destroy(currButton);
	}
}

//level end check
if(place_meeting(x, y, oEnd)) {
	if((place_meeting(x, y, oLaci)) || (place_meeting(x, y, oLaciShotgun))) {
		scriptSlideTransition(TRANS_MODE.NEXT);
	}
}

//animation stuff
if(!place_meeting(x, y + 1, oWall) || dead) {
	sprite_index = sTrevSimple;
}
else if(hsp != 0) {
	sprite_index = sTrevWalk;
}
else sprite_index = sTrevIdle;
if(hsp != 0) {
	image_xscale = sign(hsp);
}