obj_game_manager.alarm[0] = 1;              //terminate combo

with(instance_place(x,y,obj_mob_father)){   //check enenmy id
     if(other.can_take_damage){             //if can take damage
        
        other.can_take_damage = false       //cant take damage anymore, avoid loop
        
        other.hsp = sign(other.x - x) * 4;  //add horizontal force
        other.vsp = -8;                     //add vertical force
        
        other.image_index = 0;              //start animation in 0
        
        other.alarm[2] = room_speed;        //go out of state and can take damage variable
        
        if(attacking){                      //determine damage delt
            other.hp -= attack_damage;
        }
        else{
            other.hp -= damage;
        }
    }
}

sprite_index = sprt_mc_damage;  //change sprite index
image_speed = 0.08;             //animation speed

if(image_index == 2){
    image_speed = 0;            //freeze animation on last frame
}
if (vsp < 10){                  //Start adding gravity to vertical speed
    vsp += grav;
}

scr_collideandmove();           //collide and move
