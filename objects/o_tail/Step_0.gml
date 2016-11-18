/// @description Fade Out
var r = 0.95;
image_alpha -= r / 10;
image_xscale -= r / 30;
image_yscale -= r / 30;
if (image_alpha <= 0)
	instance_destroy();