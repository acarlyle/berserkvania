///scr_setupMap

// Documentation at the bottom of the page

// set default map to 0
var rmX, rmY;
for (rmX = 0; rmX < 1000; rmX += 1){
   for (rmY = 0; rmY < 1000; rmY += 1){
      global.map[rmX, rmY] = 0;
   }
}

global.map[500, 499] = scr_strBinToDec(string(01001001));
global.map[500, 500] = scr_strBinToDec(string(11001001)); //start cell
global.map[500, 501] = scr_strBinToDec(string(01001001));
global.map[500, 502] = scr_strBinToDec(string(01000111));

/* binary room value mapping

    0123 4567
    
     (these numbers are just the position of the digits, it is binary).  
    
    * 4567 - 16 variants of obj_mapPiece (is it left-right, top-bottom ...)
    
        0000 - obj_mapPiece_Open
        0001 - obj_mapPiece_L
        0010 - obj_mapPiece_T
        0011 - obj_mapPiece_R
        0100 - obj_mapPiece_B
        0101 - obj_mapPiece_TL
        0110 - obj_mapPiece_TR
        0111 - obj_mapPiece_BL
        1000 - obj_mapPiece_BR
        1001 - obj_mapPiece_LR
        1010 - obj_mapPiece_TB
        1011 -
        
    * 3    - is it a door ?
    * 2    - type of room - save, teleport
    * 1    - scout value - is this room viewable ?
    * 0    - fill this room in, or leave blank ?
    
    This is missing values such as: multiple doors in a tile, and does this
    room contain a secret ? Maybe more . . .
    
*/

//create the surface of the minimap
var color, piece, door, surf;
var piecesUsed = 10;
//surf = surface_create(16*16, 16*18); // (numWidth*tileWidth, numHeight*tileHeight)
global.mapSurf = surface_create(320*global.scaleRes, 180*global.scaleRes);
surface_set_target(global.mapSurf);
for(var yy=500; yy<510; yy++) {
    for(var xx=500; xx<510; xx++) {
        if global.map[xx,yy] & $C0 == 0 continue; //don't draw unknown rooms
        if global.map[xx,yy] & $80 color = $D08080
        else color = $808080; //set the color if room is known
        door = global.map[xx,yy] >> 4 & 3;
        piece = (global.map[xx,yy] & 15) + door * piecesUsed; //you'd define pieces_used 
        draw_sprite_ext(spr_mapPieces, piece, xx * 16, yy * 18, 1,1, color, 0, 1);
        
        //show_debug_message(string(color)); //RIGHT
        //show_debug_message(string(piece));
    }
}

surface_reset_target();
