///hound_chase

if (place_meeting(x+xspd, y, obj_solid)){
    move = move * -1;
    image_xscale = move;
    print("now THAT'S what i call move * -1");
    //print(move);
}

if (abs(obj_player.x - x) >= 100 && !attacking){
    xspd = 4;
}
else if (abs(obj_player.x - x) >= 25 && !attacking){
    xspd = 3;
}
else if (abs(obj_player.x - x) >= 19 && !attacking){
    xspd = 2;
}
else if ((abs(obj_player.x - x) <= 15 && !attacking)){
    xspd = 0;
    attacking = true;
    alarm[1] = room_speed;
    sprite_index = spr_hound_chomp;
    image_speed = .1;
}

x += (move) * xspd;
//print(move);
//print(x);
//print(xspd)
