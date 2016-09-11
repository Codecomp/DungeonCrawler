///scr_move_state

// Setup sprite state
movement = MOVE;

if(obj_input.swap_key){
    var nearest_weapon = instance_nearest(x, y, obj_weapon_item);
    if(place_meeting(x, y+4, nearest_weapon)){
        scr_swap_weapon(nearest_weapon);
    }
}

// Check for action states
if(obj_input.interact_key){
    var xdir =lengthdir_x(8, face*90);
    var ydir =lengthdir_y(8, face*90);
    var speaker = instance_place(x+xdir, y+ydir, obj_speaker);
    if(speaker != noone){
        with(speaker){
            if(!instance_exists(dialog)){
                dialog = instance_create(x+x_offset, y+y_offset, obj_dialog);
                dialog.text = text;
            } else {
                dialog.text_page++;
                dialog.text_count = 0;
                if( dialog.text_page > array_length_1d(dialog.text)-1){
                    with(dialog){
                        instance_destroy();
                    }
                }
            }
        }
        exit;
    }
}

if(obj_input.dash_key && obj_player_stats.stamina >= DASH_COST){
    state = scr_dash_state;
    alarm[0] = room_speed/6;
    
    obj_player_stats.stamina -= DASH_COST;
    obj_player_stats.alarm[0] = room_speed;
    exit;
}

if(obj_input.attack_key){
    image_index = 0;
    state = scr_attack_state;
    exit;
}

if(obj_input.fire_key){
    var p = instance_create(x, y, obj_projectile);
    var xforce = lengthdir_x(20, face*90);
    var yforce = lengthdir_y(20, face*90);
    p.creator = id;
    with(p){
        physics_apply_impulse(x, y, xforce, yforce);
    }
    exit;
}

// Get direction
dir = point_direction(0, 0, obj_input.xaxis, obj_input.yaxis);

// Get the length
if(obj_input.xaxis == 0 && obj_input.yaxis == 0){
    len = 0;
} else {
    len = spd;
    scr_get_face(dir);
}

// Get the hspd and vspd
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// Move
phy_position_x += hspd;
phy_position_y += vspd;

// Control the sprite
image_speed = .2;
if(len == 0) image_index = 0;
