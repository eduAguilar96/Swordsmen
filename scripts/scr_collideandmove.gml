//Horizontal Collision 
if (place_meeting(x+hsp,y,obj_wall)){ 
    while(!place_meeting(x+sign(hsp),y,obj_wall)){ 
        x += sign(hsp); 
    } 
    hsp = 0; 
}   
x += hsp; //Add horizontal speed to current position

//Vertical Collision 
if (place_meeting(x,y+vsp,obj_wall)){ 
    while(!place_meeting(x,y+sign(vsp),obj_wall)){ 
        y += sign(vsp); 
    } 
    vsp = 0; 
} 
y += vsp; //Add vertical speed to current position
