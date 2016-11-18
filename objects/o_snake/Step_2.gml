/// @description Tail & Powerups
var tail = instance_create_depth(x, y, depth + 1, o_tail);
tail.image_blend = image_blend;
tail.alarm[0] = 20;

// cooldown
var powerup = ds_map_find_first(powerups);
for(var i = 0; i < ds_map_size(powerups); i++)
{
    // countdown
    var val = powerups[? powerup];
    if (val > 0)
	{
		switch (powerup)
		{
			case power_type.slowmo:
			case power_type.turbo:
				phy_speed_y = espd;
				break;
		}
	
        powerups[? powerup] -= 1;
	}
		
    powerup = ds_map_find_next(powerups, powerup);
}