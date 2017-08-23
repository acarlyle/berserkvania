///scr_moveState

//Player movement
scr_getInput();

if (m_x && m_canShoot){ //shooting
    scr_fireRocket();
    alarm[1] = room_speed / 3; //cooldown
}

if (m_shift && m_hspd > 0 && m_canDash && (m_leftArrow || m_rightArrow)){ //dash
    m_state = scr_dashState;
    alarm[0] = room_speed / 8; //how long to dash
}

if (m_mKey){
    //m_state = scr_displayMap;
}

//if (m_downArrow || m_upArrow){
//    src_rotateBazooka(); //doesnt do shit
//}

if (m_spaceBar){
    m_state = scr_jumpState;
}
else if (m_ctrl){
    m_state = scr_crouchState;
}
if (m_leftArrow){
    phy_position_x -= m_hspd;
    //m_cellX -= m_hspd;
    
    sprite_index = spr_playerLeft;
    m_facingLeft = true;
    m_facingRight = false;
    //spr_bazooka.sprite_index = spr_bazookaLeft;
    //spr_rocket.sprite_index = spr_rocketLeft;
}
else if (m_rightArrow){
    phy_position_x += m_hspd;
    //m_cellY += m_hspd;
    sprite_index = spr_player;
    m_facingLeft = false;
    m_facingRight = true;
}
