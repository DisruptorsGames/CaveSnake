/// @description Generator

if (clean)
{
	var elm = layer_get_all_elements(assets);
	// remove all tiles
	for (var i = 0; i < array_length_1d(elm); i++)
	{
		if (layer_get_element_type(elm[i]) == layerelementtype_sprite)
	      layer_sprite_destroy(elm[i])
	}
	// remove all walls and fruit
	for (var i = 0; i < instance_count; i++)
	{
		var inst = instance_id[i];
		if (instance_exists(inst) && (inst.object_index == o_wall 
			|| inst.object_index == o_fruit 
			|| inst.object_index == o_powerup))
		{
			instance_destroy(inst);
		}
	}
	// new theme
	o_controller.theme = make_color_elm();
	make_color_shades(o_controller.theme);
	// stop cleaning...
	clean = false;
}

if (y < room_height)
{
	var lx = left / width, rx = right / width, yy = y / height;
    // walls
    instance_create_depth(left, y, depth, o_wall);
    instance_create_depth(right, y, depth, o_wall);
	var tleft = layer_sprite_create(assets, left, y, s_tile),
		tright = layer_sprite_create(assets, right, y, s_tile),
		color = make_color_dpk(o_controller.complimentary, random(1), random(1));
	layer_sprite_blend(tleft, color);
	layer_sprite_blend(tright, color);
    // fill
    ds_grid_set_region(data, lx + 1, yy, rx - 1, yy, -1);
	
    // point
    if (random(100) < 15)
        instance_create_layer(random_range(left + offset, right - offset), y, "Instances", o_fruit);
	// powerup
	if (random(100) < 1)
		instance_create_layer(random_range(left + offset, right - offset), y, "Instances", o_powerup);

	var diff = o_controller.game.difficulty;
	// move left builder randomly
	var c = random(100) < diff * 10;
	if (c && left < right - offset)
		left += width;
	else if (left > offset)
		left -= width;
	
	c = random(100) < diff * 10;
	if (c && right > left + offset)
		right -= width;
	else if (right < room_width - offset)
		right += width;

    y += height;
    alarm[0] = 1;
}
else
{
	// fill the grid
	for (var i = 0; i < ds_grid_width(data); i++)
	{
	    for (var j = 0; j < ds_grid_height(data); j++)
	    {
			var value = ds_grid_get(data, i, j),
				col = value == -1 
					? make_color_dpk(o_controller.darker, 0.75, random(1))
					: make_color_dpk(o_controller.theme, random(1), random(1)),
				it = layer_sprite_create(assets, i * width, j * height, s_tile);
			layer_sprite_blend(it, col);
		}
	}

	room_set_background_color(r_level, o_controller.darker, true); // DOES THIS WORK??
	physics_world_gravity(0, 5);
    var inst = instance_create_layer(512, 16, "Instances", o_snake);
	camera_set_view_target(view_camera[0], inst);
	instance_destroy();
}