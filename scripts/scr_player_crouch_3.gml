scr_getinputs_3();

if(key_down_hold){
    //This state movement values
    movespeed = 0;
    jumpspeed = initial_jumpspeed;

    //React to inputs
    move = key_left + key_right;   // determines movements direction, -1, 0 or 1
    hsp = move * movespeed;        // horizontal speed is direction * speed

    //Manage x speed based animations
    sprite_index = sprt_mc_crouch;

    if(move == 1){
        image_xscale = 1;   
    }
    if(move == -1){
        image_xscale = -1;
    }

    if (place_meeting(x,y+1,obj_wall)) //if on floor
    { 
        vsp = key_jump * -jumpspeed //it can jump
    }
    if (vsp < 0) && (!key_jump_hold){   //dynamic jumpin
        vsp -= max(vsp,-jumpspeed/8);
    }

    //Change to possible attack state
    if(key_attack){
        state = states.attacking;
    }
    //Change back to nomral state
    if (!place_meeting(x,y+1,obj_wall)){ //if leaves ground change 
        state = states.normal;
    }
}
//Change back to nomral state
else{
    state = states.normal;
}

//====Change to possible damage state on enemy contact
if(place_meeting(x,y,obj_mob_father)){
    state = states.damage;
}

scr_collideandmove();
