///scr_dashState

scr_getInput();

//if (m_spaceBar){
//    m_state = scr_jumpState;
//}

//x += m_hspd * 3;

var hspdBoost = m_hspd * 3;

//Horizontal Collision
if (place_meeting(x+hspdBoost, y, obj_solid))
{
    while(!place_meeting(x+sign(hspdBoost), y, obj_solid))
    {
        x += sign(hspdBoost);
    }
    hspdBoost = 0;
    m_hspd = 0;
}
if (m_canMove){
    x += hspdBoost;
}

//Create dash effect
var dash = instance_create(x, y, obj_playerDashEffect);
dash.sprite_index = sprite_index;
dash.image_index = image_index;
