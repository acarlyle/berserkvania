///scr_slide

//scr_getInput();
//var move = -m_leftArrow + m_rightArrow;
//if move != 0 && !m_attacking image_xscale = move; //flip sprite

var hspdFinal = m_hspd + m_hspdCarry;
m_hspdCarry = 0;
//Horizontal Collision
if (place_meeting(x+hspdFinal, y, obj_solid))
{
    while(!place_meeting(x+sign(hspdFinal), y, obj_solid))
    {
        x += sign(hspdFinal);
    }
    hspdFinal = 0;
    m_hspd = 0;
}
if (m_canMove){
    x += hspdFinal;
}
