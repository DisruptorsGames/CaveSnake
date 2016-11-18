/// @description Init
width = 16;
height = 16;
assets = layer_get_id("Assets");
clean = false;

offset = width * o_controller.game.difficulty;
left = vx + offset;
right = vw - offset;
point = vw / 2;

data = ds_grid_create(room_width / width, room_height / height);

alarm[0] = 1;