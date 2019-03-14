
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(125,125,1400,600,false);
	
	draw_set_color(c_white);
	draw_rectangle(125,125,1400,600,true);
	draw_set_alpha(1);
	
	draw_text_transformed(650,300,"-You Win-",3,3,0);
	draw_text_transformed(600,400,"Next stage, press Z",2,2,0);
	
	//if keyboard_check(ord("Z")){
	//	room_goto(room_1_2);
	//}