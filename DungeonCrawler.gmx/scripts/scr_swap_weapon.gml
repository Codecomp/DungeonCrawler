//scr_swap_weapon(new_eapon)
var new_weapon = argument[0];
var tmp = weapon_sprite;

weapon_sprite = new_weapon.sprite_index;
new_weapon.sprite_index = tmp;
