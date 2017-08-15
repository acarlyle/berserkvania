///scr_drawHUD

var i;
var offSet = 20;

for (i = 0; i < 3; i++){ //hard-coded badded >:c
    if (i >= m_numDashes){
        draw_sprite(spr_dashBoxUsed, -1, obj_view.x - 100 - offSet, obj_view.y - 70); 
    }
    else {
        draw_sprite(spr_dashBoxFull, -1, obj_view.x - 100 - offSet, obj_view.y - 70); 
    }
    offSet += 20;
}
