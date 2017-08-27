///scr_checkCell

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

show_debug_message('FALLING');

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
