///scr_getInput

m_leftArrow = keyboard_check(vk_left) || (gamepad_axis_value(0, gp_axislh) < 0);
m_rightArrow = keyboard_check(vk_right) || (gamepad_axis_value(0, gp_axislh) > 0);
m_upArrow = keyboard_check(vk_up);
m_downArrow = keyboard_check(vk_down);
m_a = keyboard_check(ord('A'));
m_d = keyboard_check(ord('D'));
m_spaceBar = keyboard_check(vk_space) || (gamepad_button_check_pressed(0, gp_face1));
m_ctrl = keyboard_check(vk_control);
m_z = keyboard_check(ord('Z')) || (gamepad_button_check_pressed(0, gp_face2));
m_x = keyboard_check(ord('X'));
m_c = keyboard_check(ord('C'));
m_shift = keyboard_check(vk_shift);
m_mKey = keyboard_check(ord('M'));

if (vk_anykey) global.moving = true;
