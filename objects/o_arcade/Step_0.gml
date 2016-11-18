/// @description Countdown
if (timer > 0)
	timer--;
else if (timer == 0)
{
	switch (status)
	{
		case game_state.spawn:
			var inst = instance_create_layer(vw / 2, 16, "Instances", o_snake)
			camera_set_view_target(view_camera[0], inst);
			break;	
		case game_state.win:
			var inst = instance_create_depth(0, 0, 50, o_generator);
			inst.clean = true;
			camera_set_view_target(view_camera[0], inst);
			win = false;
			break;
		case game_state.lose:
			room_goto(r_menu_main);
			break;
	}

	powerup = power_type.null;
	timer = -1;
}