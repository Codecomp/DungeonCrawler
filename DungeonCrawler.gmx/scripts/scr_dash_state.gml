///scr_dash_state

// Set dash speed
len = spd*4;

// Get the hspd and vspd
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// Move
phy_position_x += hspd;
phy_position_y += vspd;

// Control the sprite
var dash = instance_create(x, y, obj_effect_dash);
dash.image_index = image_index;
dash.sprite_index = sprite_index;
