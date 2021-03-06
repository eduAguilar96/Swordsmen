//Get the player's input//
key_right = keyboard_check(vk_right) || (gamepad_axis_value(0,gp_axislh) > 0); 
key_left = -(keyboard_check(vk_left) || (gamepad_axis_value(0,gp_axislh) < 0)); 

key_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z")) ||(gamepad_button_check_pressed(0,gp_face1));
key_jump_hold = keyboard_check(vk_space) || keyboard_check(ord("Z")) || (gamepad_button_check(0,gp_face1));

key_attack = keyboard_check_pressed(ord("X")) || (gamepad_button_check_pressed(0,gp_face3));

key_down = keyboard_check_pressed(vk_down) || (gamepad_axis_value(0,gp_axislv) > 0);
key_down_hold = keyboard_check(vk_down) || (gamepad_axis_value(0,gp_axislv) > 0);

key_up = keyboard_check_pressed(vk_up) || (gamepad_axis_value(0,gp_axislv) < 0);
key_up_hold = keyboard_check(vk_up) || (gamepad_axis_value(0,gp_axislv) < 0);

key_dash = keyboard_check_pressed(ord("C")) || gamepad_button_check_pressed(0,gp_shoulderrb);

key_action = keyboard_check_pressed(vk_enter) || (gamepad_button_check_pressed(0,gp_face2));

gamepad_set_axis_deadzone(0,0.5);   //gampead joysticks deadzones
gamepad_set_button_threshold(0,0.4);//gamepad trigger trhrsholds
