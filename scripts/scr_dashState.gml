///scr_dashState

scr_getInput();

//if (m_spaceBar){
//    m_state = scr_jumpState;
//}

//x += m_hspd * 3;

var hspdBoost = m_hspd * 3;



//Jumps - If touching the ground, 
if (place_meeting(x, y+1, obj_solid)){
    //m_vspd = m_spaceBar * -m_jumpSpeed; 
    m_jumps = m_jumpsMax;
    //print(m_vspd);
}
else{
    if (m_jumps == m_jumpsMax) m_jumps -=1; 
}
if (m_spaceBar) && (m_jumps > 0){
    m_jumps -= 1;
    m_vspd = -m_jumpSpeed / 2;
}
if (m_vspd < 0) && (!m_spaceBarHeld) m_vspd = max(m_vspd, 0);



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
    //print(hspdBoost);
}

//Vertical Collision
if (place_meeting(x, y+m_vspd, obj_solid))
{
    while(!place_meeting(x, y+sign(m_vspd), obj_solid))
    {
        y += sign(m_vspd);
    }
    m_vspd = 0;
}
y += m_vspd;

//Create dash effect
var dash = instance_create(x, y, obj_playerDashEffect);
dash.sprite_index = sprite_index;
dash.image_index = image_index;
