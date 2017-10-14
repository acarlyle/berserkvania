///scr_updateDashHUD

var i;
var offSet = 20;
if (surface_exists(global.dashHUD)){
    surface_set_target(global.dashHUD);
    draw_clear_alpha(c_white,0);
    surface_reset_target();
    surface_set_target(global.dashHUD);
    
    for (i = 0; i < m_maxDashes; i++){
        if (i >= m_numDashes){
            draw_sprite(spr_dashBoxUsed, -1, 100 - offSet, 60); 
        }
        else {
            draw_sprite(spr_dashBoxFull, -1, 100 - offSet,  60); 
        }
        offSet += 20;
    }
    print("drew!");
   
} 
else{
    print("suirface doesn't exist! :(");
}

//print(m_numDashes)

surface_reset_target();
