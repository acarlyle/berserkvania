///scr_dashState

scr_getInput();

//if (m_spaceBar){
//    m_state = scr_jumpState;
//}
if (m_leftArrow){
    x -= m_hspd * 3;
}
else if (m_rightArrow){
    x += m_hspd * 3;
}

//Create dash effect
var dash = instance_create(x, y, obj_playerDashEffect);
dash.sprite_index = sprite_index;
dash.image_index = image_index;
