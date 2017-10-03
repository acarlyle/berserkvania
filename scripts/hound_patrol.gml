///hound_patrol

//print("idle dogs");

if (place_meeting(x+xspd, y, obj_solid)){
    move = move * -1;
    image_xscale = move;
    print("now THAT'S what i call move * -1");
    //print(move);
    xspd = 1;
}

x += (move) * xspd;
//print(move);
//print(x);
//print(xspd)
