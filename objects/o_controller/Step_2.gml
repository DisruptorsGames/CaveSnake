/// @description Zoom & Scale

// zoom
if (mouse_wheel_up())
	zoom -= rate;
else if (mouse_wheel_down())
	zoom += rate;

zoom = clamp(zoom, 0.10, room_height / rate);

// manual camera control
if (keyboard_check(vk_left))
	camx -= 4;
else if (keyboard_check(vk_right))
	camx += 4;
if (keyboard_check(vk_up))
	camy -= 4;
else if (keyboard_check(vk_down))
	camy += 4;

var max_w = display_get_width(), max_h = display_get_height(),
    aspect = window_get_fullscreen() ? (max_w / max_h) : (base_w / base_h);
// camera
width = aspect > 1 ? min(base_w, max_w) : (height * aspect);
height = aspect > 1 ? min(base_h, max_h) : (width / aspect);
// gui
display_set_gui_size(width, height);
// surface
surface_resize(application_surface, width, height);
// view
camera_set_view_size(view_camera[0], 
	floor(overview ? room_width : width) * zoom,
	floor(overview ? room_height : height) * zoom);
view_wport[0] = max_w;
view_hport[0] = max_h;

// spring to target
//camera_set_view_target(view_camera[0], manual ? noone : o_snake);
/*var has_target = instance_exists(vt),
	r = point_distance(vx, vy, has_target ? vt.x : vx, has_target ? vt.y : vy) / room_speed,
	tsx = has_target && object_get_physics(vt) ? vt.phy_speed_x : (width / 2),
	tsy = has_target && object_get_physics(vt) ? vt.phy_speed_y : (height / 2);
camera_set_view_speed(view_camera[0], r * (has_target ? tsx : 0.2), r * (has_target ? tsx : 0.2));*/
/*var tx = instance_exists(vt) ? vt.x : 0, ty = instance_exists(vt) ? vt.y : 0,
	lx = lerp(vx, tx - width / 2, 0.2), ly = lerp(vy, ty - height / 2, 0.2);*/
camera_set_view_pos(view_camera[0], manual ? camx : vx, manual ? camy : vy);