///scr_attack_state

// Setup sprite state
movement = MELEE;


image_speed = .5;

// Create weapon animation
if(scr_animation_hit_frame(2)){
    var attack_animation = instance_create(x, y, weapon);
    attack_animation.dir = face*90;
    attack_animation.image_angle = (face*90)+45;
}

// Update srite positin and speed
if(scr_animation_hit_frame(3)){
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
    audio_play_sound(snd_sword_attack, 8, false);
    var damage = instance_create(xx, yy, obj_damage);
    damage.creator = id;
    damage.damage = obj_player_stats.attack;
    attacked = true;
}
