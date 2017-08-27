///scr_updateMap()

//check/update map due to movement

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
}
    //show_debug_message(global.map[global.mapCellX>>8,global.mapCellY>>8])
    //show_debug_message(global.curCellY);

//reset mapSurf
if (surface_exists(global.mapSurf)){
    surface_set_target(global.mapSurf);
    draw_clear_alpha(c_white,0);
    //draw_set_alpha(0);
    //draw_set_colour(c_yellow);
    //draw_rectangle(100, 100, 300, 200, true);
    surface_reset_target();
    //show_debug_message('mapSurf terminated');
}

//create the surface of the minimap
var color, piece, door;
var piecesUsed = 11;
//surf = surface_create(16*16, 16*18); // (numWidth*tileWidth, numHeight*tileHeight)
//global.mapSurf = surface_create(320*global.scaleRes, 180*global.scaleRes);
surface_set_target(global.mapSurf);

var xCell = xCellPos - 2;
var yCell = yCellPos - 1;
for (var xx = 0; xx < 5; xx++){
    for (var yy = 0; yy < 3; yy++){
    //if global.map[xCell+xx, yCell+yy] & $C0 == 0 continue; //don't draw unknown rooms
    if global.map[xCell+xx, yCell+yy] & $C0 == 0 {
        draw_sprite_ext(spr_blankTile, 0, xx * 16, yy * 18, 1, 1, 0, c_white, 1);
        continue;
    }
    if global.map[xCell+xx, yCell+yy] & $80 color = $ff0000;
    else color = $8421504; //set the color if room is known
    door = global.map[xCell+xx, yCell+yy] >> 4 & 3;
    piece = (global.map[xCell+xx, yCell+yy] & 15) + door * piecesUsed; //you'd define pieces_used 
    draw_sprite_ext(spr_mapPieces, piece, xx * 16, yy * 18, 1, 1, 0, color, 1);
    }
}

surface_reset_target();
