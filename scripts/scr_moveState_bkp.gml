///scr_moveState

//Player movement
scr_getInput();

//check if no longer underwater
if (m_underwater){
    if (!position_meeting(x, y, obj_water)){
        //print("NO MORE WATER");
        m_underwater = false;   
        m_jumpSpeed += 2;  
        m_moveSpeed += 1;
    }
}

var move = -m_leftArrow + m_rightArrow;
if move != 0 && !m_attacking image_xscale = move; //flip sprite
if (image_xscale == 1){
    m_facingRight = true;
    m_facingLeft = false;
}
else{
    m_facingRight = false;
    m_facingLeft = true;
}

m_hspd = move * m_moveSpeed;
if (m_vspd < 10) m_vspd += m_grav;

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
    m_vspd = -m_jumpSpeed;
}
//print(m_jumps);

if (m_vspd < 0) && (!m_spaceBarHeld) m_vspd = max(m_vspd, 0);
//if (m_vspd < 0) && (!m_spaceBarHeld) m_vspd = max(m_vspd, -m_jumpSpeed/2);  //less frame perfect precision ... 

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


//fire projectile
if (m_x && m_canShoot && m_hasEnergyCannon){ //shooting
    scr_fireCannon();
    alarm[1] = room_speed / 3; //cooldown
}

//if (m_shift && m_canDash){ //dash
if (m_shift && m_canDash && (m_leftArrow || m_rightArrow)){ //dash
    m_state = scr_dashState;
    alarm[0] = room_speed / 4; //how long to dash
}

//if (m_mKey){
    //m_state = scr_displayMap;
//}

//Animate
/*if (move!=0) image_xscale = move;
if (place_meeting(x,y+1,obj_wall))
{
    if (move!=0) 
    {
        sprite_index = spr_player_run; 
        image_speed = 1;
    }
    else sprite_index = spr_player_idle; image_speed = 0.5;
}
else
{
    if (vsp < 0) sprite_index = spr_player_jump; else sprite_index = spr_player_fall;
}*/
