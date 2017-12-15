///scr_jumpState

// NO LONGER USED!!!

scr_getInput();

//show_debug_message('jump jump trampoline')

if (m_leftArrow){
    sprite_index = spr_playerLeft;
    phy_position_x -= m_hspd;
}
else if (m_rightArrow){
    sprite_index = spr_player;
    phy_position_x += m_hspd;
}

if (m_x && m_canShoot){ //shooting
    scr_fireCannon();
    alarm[1] = room_speed / 2; //cooldown
}

if (m_airborn){ //exit jumpState
    if (place_meeting(x, y+1, obj_solid)){
        m_vspd = 0;
        m_airborn = false;
        m_state = scr_moveState;
    }
}

if (m_vspd < 10){
    m_vspd += m_grav;
}

if (place_meeting(x, y+1, obj_solid)){ //we're on the floor
    m_airborn = true;
    m_vspd = m_spaceBar * -m_jumpSpeed; 
}

phy_position_y += m_vspd;
