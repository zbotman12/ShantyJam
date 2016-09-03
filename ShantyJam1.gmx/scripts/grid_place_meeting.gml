///grid_place_meeting(x,y)
var xx = argument0;
var yy = argument1;

//Remember our position
var xp = x;
var yp = y;

//update the position for the bbox calcuations
x = xx;
y = yy;

// Check for an x meeting
var x_meeting = (obj_level.grid[# bbox_right /*right side X value*/ div CELL_WIDTH, bbox_top /*top side Y value*/ div CELL_HEIGHT] != FLOOR) || 
                (obj_level.grid[# bbox_left div CELL_WIDTH, bbox_top div CELL_HEIGHT] != FLOOR);
var y_meeting = (obj_level.grid[# bbox_right div CELL_WIDTH, bbox_bottom div CELL_HEIGHT] != FLOOR) || 
                (obj_level.grid[# bbox_left div CELL_WIDTH, bbox_bottom div CELL_HEIGHT] != FLOOR);
var center_meeting = (obj_level.grid[# xx div CELL_WIDTH, yy div CELL_HEIGHT] != FLOOR);

//Move Back
x = xp;
y = yp;

//Return either true or false
return x_meeting || y_meeting || center_meeting;