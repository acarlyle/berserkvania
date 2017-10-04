///scr_engageAIBehavior(rngBvr)

//bvrScipt, sprite_index, alarm[0], image_speed

if (behaviors[argument[0], 4] == 1){
    m_state = behaviors[argument[0], 0];
    sprite_index = behaviors[argument[0], 1];
    alarm[0] = behaviors[argument[0], 2];
    image_speed = behaviors[argument[0], 3];
}

else{ //enage idle behavior, which should always be enabled/first behavior
    m_state = behaviors[0, 0];
    sprite_index = behaviors[0, 1];
    alarm[0] = behaviors[0, 2];
    image_speed = behaviors[0, 3];
    print("Idle engaged due to bvr not enabled");
}
