vsp = vsp + grv;
if(place_meeting(x, y+vsp, oWall)) {
	while(!place_meeting(x, y+sign(vsp), oWall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;