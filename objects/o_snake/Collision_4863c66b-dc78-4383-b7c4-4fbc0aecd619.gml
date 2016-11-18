/// @description Collect Powerup
var powerup = power_type.null, time = seconds(5), effect = ef_spark;
switch(other.image_index)
{
	case 0: 
		powerup = power_type.slowmo;
		espd = phy_speed_y / 2;
		effect = ef_smoke;
		break;
	case 1: 
		powerup = power_type.turbo;
		espd = phy_speed_y * 2;
		effect = ef_flare;
		break;
}
effect_create_above(effect, x, y, 2, other.image_blend);
powerups[? powerup] = time;
set_score(5);
with (other) { instance_destroy(); }