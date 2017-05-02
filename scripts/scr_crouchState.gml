///scr_crouchState

sprite_index = spr_playerCrouched;

if(keyboard_check(vk_control)){
    scr_getInput();

    if (m_leftArrow){
        phy_position_x -= m_hspd/2;
    }
    else if (m_rightArrow){
        phy_position_x += m_hspd/2;
    }
}

else{
    sprite_index = spr_player;
    m_state = scr_moveState;
}
