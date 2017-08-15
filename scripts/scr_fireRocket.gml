///scr_fireRocket

var bazookaAngle = 0;
var vspd = 0;
var hspd = 4;

if (m_facingLeft){
    hspd *= -1;
}

if (m_z){
    if (m_facingRight){
        bazookaAngle = 45;
        vspd = -2;
    }
    else if (m_facingLeft){
        bazookaAngle = 135;
        vspd = -2;
    }
}
if (m_c){
    if (m_facingRight){
        bazookaAngle = 315;
        vspd = 2;
    }
    else if (m_facingLeft){
        bazookaAngle = 225;
        vspd = 2;
    }
}

var bullet = instance_create(x+1, y-1, obj_rocket);
if (m_facingLeft){
    bullet.sprite_index = spr_rocketLeft;
}
with (bullet){
    if (obj_player.m_z || obj_player.m_c){
        image_angle = bazookaAngle + obj_player.m_facingLeft * 180;
    }
    else if (obj_player.m_facingLeft){
        image_angle = bazookaAngle;
    }
    else {
        image_angle = bazookaAngle;
    }
    m_vspd = vspd;
    m_hspd = hspd;
}

m_canShoot = false;
