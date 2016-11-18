///@function smooth_view
///@param view_index
///@param view_speed
///@param view_width
///@param view_height

var vi = argument[0];
var ls = argument[1];
camera_set_view_size(view_camera[vi],argument[2],argument[3]);
var w = camera_get_view_width(view_camera[vi]);
var h = camera_get_view_height(view_camera[vi]);
var xx = camera_get_view_x(view_camera[vi]);
var yy = camera_get_view_y(view_camera[vi]);
var lx = lerp ( xx,( x-w/2),ls );
var ly = lerp ( yy,( y-h/2),ls );

/////////////////////////////////////////
//keeps view inside boundaries of room //
/////////////////////////////////////////
var cx = min( max( lx, 0 ), room_width - (w) ); 
var cy = min( max( ly, 0 ), room_height - (h) );
camera_set_view_pos(view_camera[vi],cx,cy)