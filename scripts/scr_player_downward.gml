//scr_getinputs();
if(!place_meeting(x,y+1,obj_wall)){
    vsp = 15;
    movespeed = 0;
    sprite_index = sprt_mc_downward;
}else{
    state = states.normal
}
scr_collideandmove();
