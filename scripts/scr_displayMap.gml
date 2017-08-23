///scr_displayMap

if (!global.pause){
    global.pause = 1;
    show_debug_message('deactivating');
    instance_deactivate_all(true);
    //room_goto(rm_map);
    show_debug_message('ill pay if you take off your top')
}

else{
    global.pause = 0;
    instance_activate_all();
    room_goto(global.currentRoom);
}
