///scr_get_input
right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);
dash_key = keyboard_check_pressed(ord('C'));
attack_key = keyboard_check_pressed(ord(' '));
fire_key = keyboard_check_pressed(vk_control);
interact_key = keyboard_check_pressed(ord(' '));
pause_key = keyboard_check_pressed(vk_escape);
swap_key = keyboard_check_pressed(vk_alt);

// Get the Axis
xaxis = right_key - left_key;
yaxis = down_key - up_key;

// Gamepad movement
if(gamepad_is_connected(0)){
    gamepad_set_axis_deadzone(0, .35);
    xaxis = gamepad_axis_value(0, gp_axislh);
    yaxis = gamepad_axis_value(0, gp_axislv);
    dash_key = gamepad_button_check_pressed(0, gp_face2);
    attack_key = gamepad_button_check_pressed(0, gp_face1);
    fire_key = gamepad_button_check_pressed(0, gp_face3)
    interact_key = gamepad_button_check_pressed(0, gp_face1);
    pause_key = gamepad_button_check_pressed(0, gp_start);
    swap_key = gamepad_button_check_pressed(0, gp_face4);
}
