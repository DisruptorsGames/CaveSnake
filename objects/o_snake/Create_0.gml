/// @description Init

// movement
espd = 0;
spd = 50;
max_spd = 5;
// mobile
accel = 1.75;
dx = 0;
dy = 0;
dz = 0;
// controls
left = ord("A");
right = ord("D");
jump = vk_space;
//
powerups = ds_map_create();
ds_map_add(powerups, power_type.slowmo, 0);
ds_map_add(powerups, power_type.turbo, 0);

image_blend = o_controller.complimentary;