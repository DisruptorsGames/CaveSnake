/// @description Init
image_index = irandom(image_number - 1);
image_speed = 0;
image_blend = make_color_dpk(o_controller.complimentary, 0.25, random(1));