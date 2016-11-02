//Attack

//This state movement values
move = 0;           //stop movement
movespeed = 0;
jumpspeed = 0;
vsp = 0;

//This State animation handling
if(place_meeting(x,y+5,obj_wall)){    //if on floor... animation
    sprite_index = sprt_mc_attack_floor;
}
if(!place_meeting(x,y+5,obj_wall)){   //if on air... animation
    sprite_index = sprt_mc_attack_air;
}
if(sprite_index = 1){        //freeze on index of attack
    image_speed = 0;
}

//Attacking managemnet
if(can_attack && !can_combo && last_attack == 0){    //if key pressed and first attack
    can_attack = 0;
    instance_create(x + 10*(move), y + 5, obj_mc_slash1)
    alarm[0] = obj_mc_slash1.lifetime/2;            //toggle back can_attack to true and normal state
    alarm[1] = combo_time;                          //toogle timer for disabling combo.
    can_combo = 1;
    last_attack = 1;
}
if(can_attack && can_combo && last_attack == 1){
    can_attack = 0;
    instance_create(x + 10*(move), y + 5, obj_mc_slash2);
    alarm[0] = obj_mc_slash2.lifetime/2;            //toggle back can_attack to true and normal state
    alarm[1] = combo_time;                          //toogle timer for disabling combo.
    can_combo = 1;
    last_attack = 2;
}
if(can_attack && can_combo && last_attack == 2){
    can_attack = 0;
    instance_create(x + 10*(move), y + 5, obj_mc_slash3);
    alarm[0] = obj_mc_slash3.lifetime/2;            //toggle back can_attack to true and normal state
    alarm[1] = combo_time;                          //toogle timer for disabling combo.
    can_combo = 0;
    last_attack = 2;
}




