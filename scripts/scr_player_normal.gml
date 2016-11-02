scr_getinputs();

//This state movement values
movespeed = initial_movespeed;
jumpspeed = initial_jumpspeed;

//React to inputs
move = key_left + key_right;   // determines movements direction, -1, 0 or 1
hsp = move * movespeed;        // horizontal speed is direction * speed

//Manage x speed based animations
if(move == 1){
    image_xscale = 1;
    if(vsp == 0){
        sprite_index = sprt_mc_walk; // 12 frames
        image_speed = 0.3;
    }
}
if(move == -1){
    image_xscale = -1;
    if(vsp == 0){
        sprite_index = sprt_mc_walk; // 12 frames
        image_speed = 0.3;
    }
}
if(move == 0 && vsp == 0){
    sprite_index = sprt_mc_idle; // 4 frames
    image_speed = 0.1;
}

//Manage y based animations

if (vsp < 0 && !place_meeting(x,y+vsp,obj_wall)){ //if going up and not touching floor
    sprite_index = sprt_mc_jump_up; // 2 frames
    image_speed = 0.1;
}
if (vsp > 0 && !place_meeting(x,y+vsp,obj_wall)){ //if going down and not touching floor
    sprite_index = sprt_mc_jump_trans;   // 2 frames
    image_speed = 0.01;
}
if (vsp > 2 && !place_meeting(x,y+vsp,obj_wall)){ //if going down and not touching floor
    sprite_index = sprt_mc_jump_down;   // 2 frames
    image_speed = 0.1;
}

if (vsp < 10){  //Start adding gravity to vertical speed
    vsp += grav;
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

scr_collideandmove();
