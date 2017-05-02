///scr_dashState

src_getInput();

//if (m_spaceBar){
//    m_state = src_jumpState;
//}
if (m_leftArrow){
    phy_position_x -= m_hspd * 3;
}
else if (m_rightArrow){
    phy_position_x += m_hspd * 3;
}

//Create dash effect
var dash = instance_create(x, y, obj_playerDashEffect);
dash.sprite_index = sprite_index;
dash.image_index = image_index;
