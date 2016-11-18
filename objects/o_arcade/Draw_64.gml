/// @description Game HUD

var lighter = o_controller.lighter, 
	lifecolor = instance_exists(o_snake) 
		? o_snake.image_blend 
		: o_controller.theme;

// countdown
if (!instance_exists(o_snake) && timer > 0)
{
    var time = round(timer / room_speed);
    draw_banner(message, "(" + string(time) + ")", c_black, lighter, 64);
}

// lives
for (var i = 0; i < lives; i++)
{
	var w = sprite_get_width(s_snake), hh = sprite_get_height(s_snake) / 2,
		col = merge_color(c_red, lifecolor, lives / max_lives);
	draw_sprite_ext(s_snake, 0, 16 + w / 2 + i * (w + 2), 48 + hh, 1, 1, 0, col, 1);
}

// score
var text = string(score) + ":" + string(level);
draw_set_font(f_hud);
draw_text_color((vw - string_width(text)) / 2, 16, text, lighter, lighter, lighter, lighter, 1);
draw_set_font(-1);