///scr_attack_state

// Setup sprite state
movement = MELEE;

// Update srite positin ans speed
image_speed = .5;
if(image_index >= 3 && attacked == false){
    var xx = 0;
    var yy = 0;
    switch(face){
        case UP:
            xx = x;
            yy = y-10; 
            break;
        case DOWN:
            xx = x;
            yy = y+12; 
            break;
        case LEFT:
            xx = x-10;
            yy = y+2; 
            break;
        case RIGHT:
            xx = x+10;
            yy = y+2; 
            break;
    }
    var damage = instance_create(xx, yy, obj_damage);
    damage.creator = id;
    damage.damage = obj_player_stats.attack;
    attacked = true;
}
