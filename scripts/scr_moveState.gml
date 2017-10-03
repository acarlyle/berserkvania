///scr_moveState
/*
//check/update map due to movement
if (global.moving){
    var updateMap = false;
    global.curCellX = floor(phy_position_x/320);
    global.curCellY = floor(phy_position_y/320);
    
    if (global.curCellX != global.newCellX){
        if (global.newCellX < global.curCellX){
            global.curCellX--;
            global.mapCellX--;
        }
        else{
            global.curCellX++;   
            global.mapCellX++;
        }
        updateMap = true;
        show_debug_message('1!');
    }
    if (global.curCellY != global.newCellY){
        if (global.newCellY < global.curCellY){
            global.curCellY++;
            global.mapCellY++;
        }
        if (global.newCellY > global.curCellY){
            global.curCellY--;   
            global.mapCellY--;
        }
        updateMap = true;
        show_debug_message('2!');
    }
    if (updateMap){
        updateMap = false;
        global.map[global.mapCellX>>8,global.mapCellY>>8] |= $80;
        scr_updateMap();
    }
    //show_debug_message(global.map[global.mapCellX>>8,global.mapCellY>>8])
    //show_debug_message(global.curCellY);
}
global.moving = false;
*/
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
m_hspd = move * m_moveSpeed;
    
//if (m_leftArrow){
//    print('nig');
//}
    
if (m_vspd < 5) m_vspd += m_grav;
if (place_meeting(x, y+1, obj_solid)){
    m_vspd = m_spaceBar * -m_jumpSpeed; 
}
    
//Horz. collision
if (place_meeting(x+m_hspd, y, obj_solid)){
    while(!place_meeting(x+sign(m_hspd), y, obj_solid)){
        x += sign(m_hspd);
    }
    m_hspd = 0;
} 
//x += m_hspd;
    
//Vert. collision
if (place_meeting(x, y+m_vspd, obj_solid)){
    while(!place_meeting(x, y+sign(m_vspd), obj_solid)){
        y += sign(m_vspd);
    }
    m_vspd = 0;
} 
    
y += m_vspd;
    
if (m_canMove){
    x += m_hspd;    
}


/*
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
}*/


