/// @description Controls

// motion controls
if (os_type == os_ios)
{
    // accelerometer
    dx = device_get_tilt_x() * spd * accel;
    dy = device_get_tilt_y() * spd * accel;
    dz = device_get_tilt_z() * spd * accel;
    
    switch (display_get_orientation())
    {
        // reverse of y for landscape
        case display_landscape:
            physics_apply_force(x, y, -dy, 0);
            break;
        case display_portrait:
            physics_apply_force(x, y, dx, 0);
            break;
    }
    
    // jump
    if (mouse_check_button_pressed(mb_left) /*&& onGround(phy_position_x, phy_position_y)*/)
        physics_apply_impulse(x, y, 0, -spd / 2);
}
// keyboard movement
else
{
	// ToDo: Fix bounce on left click (and collision with wall)
    if (mouse_check_button(mb_left))
        physics_apply_force(x, y, -spd, 0);
    else if (mouse_check_button(mb_right))
        physics_apply_force(x, y, spd, 0);
}

phy_speed_y = clamp(phy_speed_y, 0, max_spd);







