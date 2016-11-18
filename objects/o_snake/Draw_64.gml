/// @description HUD

// speed
draw_set_font(f_hud);
var text = string(round(phy_speed));
draw_text_color(vw / 2, vh - string_height(text) - font_get_size(f_hud), text, image_blend, image_blend, image_blend, image_blend, floor(phy_speed) / max_spd);
draw_set_font(-1);

// powerup
var powerup = ds_map_find_first(powerups);
for(var i = 0; i < ds_map_size(powerups); i++)
{
    // countdown
    var val = powerups[? powerup];
    if (val > 0)
	{
		var index = -1, text = string(round(val / room_speed)), color = o_controller.lighter, scale = 4, 
			sw = sprite_get_width(s_powerup) * scale + 4, sh = sprite_get_height(s_powerup) * scale,
			ix = (vw - ds_map_size(powerups) * (sw / 2)) / 2, iy = vh - sh;
		switch (powerup)
		{
			case power_type.slowmo: index = 0 break;
			case power_type.turbo: index = 1 break;
		}
		draw_sprite_ext(s_powerup, index, ix + i * sw, 16 + iy, scale, scale, 0, image_blend, 1);
		draw_set_font(f_title);
		draw_text_color(ix + i * sw, 16 + iy, text, color, color, color, color, 1);
		draw_set_font(-1);
	}
    powerup = ds_map_find_next(powerups, powerup);
}