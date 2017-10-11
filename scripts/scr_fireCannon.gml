///scr_fireCannon

var projectileAngle = 0;
var vspd = 0;
var hspd = 4;

if (m_facingLeft){
    hspd *= -1;
}

if (m_z){
    if (m_facingRight){
        projecticleAngle = 45;
        vspd = -2;
    }
    else if (m_facingLeft){
        projectileAngle = 135;
        vspd = -2;
    }
}
if (m_c){
    if (m_facingRight){
        projectileAngle = 315;
        vspd = 2;
    }
    else if (m_facingLeft){
        projectileAngle = 225;
        vspd = 2;
    }
}

var projectile = instance_create(x+1, y-1, obj_rocket);
if (m_facingLeft){
    projectile.sprite_index = spr_rocketLeft;
}
with (projectile){
    if (obj_player.m_z || obj_player.m_c){
        image_angle = projectileAngle + obj_player.m_facingLeft * 180;
    }
    else if (obj_player.m_facingLeft){
        image_angle = projectileAngle;
    }
    else {
        image_angle = projectileAngle;
    }
    m_vspd = vspd;
    m_hspd = hspd;
}

m_canShoot = false;
