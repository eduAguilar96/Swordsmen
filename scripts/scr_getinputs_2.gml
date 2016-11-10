//Get the player's input//
key_right = gamepad_axis_value(1,gp_axislh) > 0; 
key_left = gamepad_axis_value(1,gp_axislh) < 0; 

key_jump = (gamepad_button_check_pressed(1,gp_face1));
key_jump_hold = (gamepad_button_check(1,gp_face1));

key_attack = (gamepad_button_check_pressed(1,gp_face3));
key_down_hold = (gamepad_axis_value(1,gp_axislv) > 0);

key_up_hold = (gamepad_axis_value(1,gp_axislv) < 0);

key_dash = gamepad_button_check_pressed(1,gp_shoulderrb);

key_action = (gamepad_button_check_pressed(1,gp_face2));
