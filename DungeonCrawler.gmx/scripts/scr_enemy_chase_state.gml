///scr_enemy_chase_state

scr_check_for_player();

// Move towards target
var dir = point_direction(x, y, targetx, targety);
var hspd = lengthdir_x(spd, dir);
var vspd = lengthdir_y(spd, dir);
phy_position_x += hspd;
phy_position_y += vspd;

// Flip sprite towards direction
if(hspd != 0)
    image_xscale = sign(hspd);
