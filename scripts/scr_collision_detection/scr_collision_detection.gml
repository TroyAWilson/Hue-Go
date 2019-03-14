//Collision check with walls 

arg0 = argument0;

if (place_meeting(x + hspd, y, arg0)){
	while(!place_meeting(x+sign(hspd),y,arg0)){ // While not touching that solid
		x+= sign(hspd); //Moves one pixel at a time to prevent us from going into walls
	}
	
	////////////////////////////////////////////////////////////////////////////////
	//Check for colors collisions of same color on horizontal axis
	////////////////////////////////////////////////////////////////////////////////
	
	if arg0 == obj_red_thing && obj_hue_go.sprite_index == spr_hue_red{
		red_block = instance_nearest(x,y,arg0)
		with red_block{
			instance_destroy();
		}
	}
	
	else if arg0 == obj_blue_thing && obj_hue_go.sprite_index == spr_hue_blue{
		blue_block = instance_nearest(x,y,arg0)
		with blue_block{
			instance_destroy();
		}
	}
	
	else if arg0 == obj_yellow_thing && obj_hue_go.sprite_index == spr_hue_yellow{
		yellow_block = instance_nearest(x,y,arg0)
		with yellow_block{
			instance_destroy();
		}
	}
	////////////////////////////////////////////////////////////////////////////////
	
	
	////////////////////////////////////////////////////////////////////////////////
	//Color Collision of opposing colors on horizontal axis
	////////////////////////////////////////////////////////////////////////////////
		
		if arg0 == obj_red_thing && obj_hue_go.sprite_index == spr_hue_blue{
		red_block = instance_nearest(x,y,arg0)
		show_debug_message("BLUE TOUCH RED HORIZONTAL");
		with (red_block){
			hspeed = sign(obj_hue_go.hspd);
		}
	}
	
	else if arg0 == obj_blue_thing && obj_hue_go.sprite_index == spr_hue_red{
		blue_block = instance_nearest(x,y,arg0)
		show_debug_message("RED TOUCH BLUE HORIZONTAL");
		with (blue_block){
			hspeed = sign(obj_hue_go.hspd);
		}
	}
	
	//else if arg0 == obj_yellow_thing && obj_hue_go.sprite_index == spr_hue_yellow{
	//	yellow_block = instance_nearest(x,y,arg0)
	//	with yellow_block{
	//		instance_destroy();
	//	}
	//}
	
	////////////////////////////////////////////////////////////////////////////////
	hspd = 0;
}
else{
	obj_blue_thing.hspeed = 0;
	obj_red_thing.hspeed = 0;
}


//Move Horizontally
x += hspd;

//Vertical Collisions checks to see if next spot has a solid 
if (place_meeting(x, y + vspd, arg0)){
	while(!place_meeting(x,y + sign(vspd),arg0)){ // While not touching that solid
		y+= sign(vspd); //Moves one pixel at a time to prevent us from going into walls
	}
	if arg0 == obj_red_thing && obj_hue_go.sprite_index == spr_hue_red{// If the object colliding is the red block and the player is red then...
		red_block = instance_nearest(x,y,arg0)//Get the id of the closest instance
		with red_block {//with that instance
			instance_destroy();//destroy it
		}
	}
	else if arg0 == obj_blue_thing && obj_hue_go.sprite_index == spr_hue_blue{// If the object colliding is the red block and the player is red then...
		blue_block = instance_nearest(x,y,arg0)//Get the id of the closest instance
		with blue_block {//with that instance
			instance_destroy();//destroy it
		}
	}
	else if arg0 == obj_yellow_thing && obj_hue_go.sprite_index == spr_hue_yellow{// If the object colliding is the red block and the player is red then...
		yellow_block = instance_nearest(x,y,arg0)//Get the id of the closest instance
		with yellow_block {//with that instance
			instance_destroy();//destroy it
		}
	}
	vspd = 0;
}

//Move Vertically
y+= vspd;