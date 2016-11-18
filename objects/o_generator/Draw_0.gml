/// @description Draw World

if (global.debug)
{
    // builders
    draw_rectangle_color(left, y, left + width, y + height, c_blue, c_blue, c_blue, c_blue, true);
    draw_rectangle_color(right, y, right + width, y + height, c_red, c_red, c_red, c_red, true);
	// bumpers
	var lb = left + offset, rb = right - offset;
	draw_rectangle_color(rb, y, rb + width, y + height, c_yellow, c_yellow, c_yellow, c_yellow, true);
	draw_rectangle_color(lb, y, lb + width, y + height, c_yellow, c_yellow, c_yellow, c_yellow, true);
    
    // draw reference point
    draw_rectangle_color(0, y - 2, room_width, y + 2, c_red, c_red, c_red, c_red, false);
	
	// draw grid data (-1, 0, etc)
	for (var i = 0; i < ds_grid_width(data); i++)
	{
	    for (var j = 0; j < ds_grid_height(data); j++)
	    {
	        // get grid real world x/y
	        var ix = i * width, iy = j * height,
	            value = ds_grid_get(data, i, j);
		
			if (value == -1)
				draw_text_color(ix, iy, string(value), c_white, c_white, c_white, c_white, 0.45);
	    }
	}
}