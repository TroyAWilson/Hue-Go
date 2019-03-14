/// @description Insert description here
// You can write your code in this editor

//Change color oh Huego
if keyboard_check_pressed(ord("Z"))&& obj_win.draw_win == false{
	sprite_index = spr_hue_red
}
else if keyboard_check_pressed(ord("X"))&& obj_win.draw_win == false{
	sprite_index  = spr_hue_blue
}
else if keyboard_check_pressed(ord("C"))&& obj_win.draw_win == false{
	sprite_index  = spr_hue_yellow
}

//If you ever look over this movement code and don't understand check this
//https://www.youtube.com/watch?v=ZFX7IHhZw7g



//Movement mechanics
var rkey = keyboard_check(vk_right);
var lkey = keyboard_check(vk_left);
var jkey = keyboard_check(vk_up);

//check for ground

if (place_meeting(x,y+1, obj_wall) || place_meeting(x,y+1, obj_red_thing) || place_meeting(x,y+1, obj_blue_thing) || place_meeting(x,y+1, obj_yellow_thing)) && obj_win.draw_win == false{
	vspd = 0;
	
	//jumping
	if (jkey){
		vspd = -jspd;
	}
} else {
	//Gravity
	if (vspd < 10) {
		vspd += grav;
	}
}

//Move right
if (rkey) && obj_win.draw_win == false{
	hspd = spd;
}

//Move left
if (lkey)&& obj_win.draw_win == false{
	hspd = -spd;
}

//Check for not moving
if ((!rkey && !lkey) || (rkey && lkey)){
	hspd = 0;
}

if place_meeting(x + hspd,y + vspd,obj_red_thing){
	script_execute(scr_collision_detection(obj_red_thing))
}
else if place_meeting(x + hspd,y + vspd,obj_blue_thing){
	script_execute(scr_collision_detection(obj_blue_thing))
}
else if place_meeting(x + hspd,y + vspd,obj_yellow_thing){
	script_execute(scr_collision_detection(obj_yellow_thing))
}
else{
	script_execute(scr_collision_detection(obj_wall))
}

if keyboard_check(vk_tab){
	obj_hue_go.x = start_x;
	obj_hue_go.y = start_y;
	room_restart();
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////
////Test Space
////////////////////////////////////////////////////////////////////////////////////////////////////////////
