scr_getinputs_4();

move = key_left + key_right;        // determines movements direction, -1, 0 or 1
up = key_up_hold - key_down_hold;

image_blend = player_color;

if(!dashing){
    
    
    dashing = true;
    image_speed = 1;
    alarm[4] = room_speed * 0.25;
    
    if(move == 1 && up == 0){           //dash right
        sprite_index = sprt_mc_dash;
        hsp = 20;
        vsp = 0;
        image_angle = 0;
        image_xscale = 1;
    
    }else if(move == -1 && up == 0){    //dash left
        sprite_index = sprt_mc_dash;
        hsp = -20;
        vsp = 0;
        image_angle = 0;
        image_xscale = -1;
    
    }else if(move == 0 && up == 1){    //dash up
        sprite_index = sprt_mc_dash;
        hsp = 0;
        vsp = -20;
        image_angle = 90;
        image_xscale = 1;
    
    }else if(move == 0 && up == -1){     //dash down
        sprite_index = sprt_mc_dash;
        hsp = 0;
        vsp = 20;
        image_angle = 270;
        image_xscale = 1;
    
    }else if(move == 1 && up == 1){     //dash 45
        sprite_index = sprt_mc_dash;
        hsp = 14;
        vsp = -14;
        image_angle = 45;
        image_xscale = 1;
    
    }else if(move == -1 && up == 1){     //dash 135
        sprite_index = sprt_mc_dash;
        hsp = -14;
        vsp = -14;
        image_angle = 315;
        image_xscale = -1;
    
    }else if(move == -1 && up == -1){     //dash 225
        sprite_index = sprt_mc_dash;
        hsp = -14;
        vsp = 14;
        image_angle = 45;
        image_xscale = -1;
    
    }else if(move == 1 && up == -1){     //dash 315
        sprite_index = sprt_mc_dash;
        hsp = 14;
        vsp = 14;
        image_angle = 315;
        image_xscale = 1;
    
    }else{
        state = states.normal;
        image_angle = 0;
    }  
}

//====Change to possible damage state on lava block touch
if( place_meeting(x,y+1,obj_lava_block)
    || place_meeting(x,y-1,obj_lava_block)
    || place_meeting(x+1,y,obj_lava_block)
    || place_meeting(x-1,y,obj_lava_block)){
        
        state = states.damage;
}

instance_create(x,y,obj_mc_dash_hitbox);

scr_collideandmove();
