///src_crouchState

if(keyboard_check(vk_control)){
    src_getInput();

    if (m_leftArrow){
        sprite_index = spr_playerCrouchedLeft;
        phy_position_x -= m_hspd/2;
        m_facingLeft = true;
        m_facingRight = false;
    }
    else if (m_rightArrow){
        sprite_index = spr_playerCrouched;
        phy_position_x += m_hspd/2;
        m_facingLeft = false;
        m_facingRight = true;
    }
    else{ //standing still
        if (m_facingRight){
            sprite_index = spr_playerCrouched;
            m_facingLeft = false;
            m_facingRight = true;
        }
        else if (m_facingLeft){
            sprite_index = spr_playerCrouchedLeft;
            m_facingLeft = true;
            m_facingRight = false;
        }
    }
    
    if (m_x && m_canShoot){ //shooting
        src_fireRocket();
        alarm[1] = room_speed / 2; //cooldown
    }
    
    //if(keyboard_check(vk_control)){
    //    m_state = src_crouchState;
    //} 
}

else{
    if (sprite_index == spr_playerCrouched){
        sprite_index = spr_player;
    }
    else if (sprite_index == spr_playerCrouchedLeft){
        sprite_index = spr_playerLeft;
    }
    m_state = src_moveState;
}
