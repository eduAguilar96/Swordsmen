scr_getinputs_4();

//====This state movement values
movespeed = initial_movespeed;
jumpspeed = initial_jumpspeed;

//====React to inputs
move = key_left + key_right;                        // determines movements direction, -1, 0 or 1
hsp = move * movespeed;                             // horizontal speed is direction * speed

//====this state color
image_blend = c_orange;

//====Manage x speed based animations
if(move == 1){
    image_xscale = 1;
    if(vsp == 0){
        sprite_index = sprt_mc_walk;                // 12 frames
        image_speed = 0.3;
    }
}
if(move == -1){
    image_xscale = -1;
    if(vsp == 0){
        sprite_index = sprt_mc_walk;                // 12 frames
        image_speed = 0.3;
    }
}
if(move == 0 && vsp == 0){
    sprite_index = sprt_mc_idle;                    // 4 frames
    image_speed = 0.1;
}

//====Manage y based animations

if (vsp < 0 && !place_meeting(x,y+vsp,obj_wall)){   //if going up and not touching floor
    sprite_index = sprt_mc_jump_up;                 // 2 frames
    image_speed = 0.1;
}
if (vsp > 0 && !place_meeting(x,y+vsp,obj_wall)){   //if going down and not touching floor
    sprite_index = sprt_mc_jump_trans;              // 2 frames
    image_speed = 0.01;
}
if (vsp > 2 && !place_meeting(x,y+vsp,obj_wall)){   //if going down and not touching floor
    sprite_index = sprt_mc_jump_down;               // 2 frames
    image_speed = 0.1;
}

if (vsp < 10){  //Start adding gravity to vertical speed
    vsp += grav;
}
if (place_meeting(x,y+1,obj_wall))                  //if on floor
{ 
    attack_bank = initial_attack_bank;              //it can allways attack            

    if(key_jump){                                   //it can jump
        vsp = -jumpspeed;
        
        attack_bank = initial_attack_bank;          //attack refinement and reset
        can_attack = true;
        can_combo = false;
        last_attack = 0;
    }
    
    //====Change to possible crouch state
    if(key_down_hold){
        state = states.crouch;
    }
}
if (vsp < 0) && (!key_jump_hold){                   //dynamic jumpin
    vsp -= max(vsp,-jumpspeed/8);
}

//====Change to possible attack state or downward state
if(key_attack && !place_meeting(x,y+1,obj_wall) && key_down_hold){
    state = states.downward;
}else if(key_attack && attack_bank > 0){
    state = states.attacking;
}

//====Change to possible Dash state
if(key_dash && dash_bank >= 1){
    state = states.dash;
}
if(dash_bank < initial_dash_bank){                  //regen dash
    dash_bank += 0.01;
}

//====Change to possible damage state on enemy contact
//if(place_meeting(x,y,obj_mob_father)){
//    state = states.damage;
//}

scr_collideandmove();
