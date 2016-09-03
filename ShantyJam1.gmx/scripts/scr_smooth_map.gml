///scr_smooth_map(numberOfTimes)

var numberOfTimes = argument0;

repeat(numberOfTimes){
    for(var yy = 1; yy < height - 1; yy++){
        for(var xx = 1; xx < width - 1; xx++){
        
            var voidcount = 0;
            if(global.grid[# xx+1, yy] == VOID) voidcount++;
            if(global.grid[# xx-1, yy] == VOID) voidcount++;
            if(global.grid[# xx, yy+1] == VOID) voidcount++;
            if(global.grid[# xx, yy-1] == VOID) voidcount++;
            if(global.grid[# xx+1, yy+1] == VOID) voidcount++;
            if(global.grid[# xx-1, yy-1] == VOID) voidcount++;
            if(global.grid[# xx-1, yy+1] == VOID) voidcount++;
            if(global.grid[# xx+1, yy-1] == VOID) voidcount++;
            
            if(voidcount == 0 && global.grid[# xx, yy] == FLOOR){
                global.grid[# xx, yy] = VOID;
            }
        }
    }
}

repeat(numberOfTimes - 1){
    for(var yy = 1; yy < height - 1; yy++){
        for(var xx = 1; xx < width - 1; xx++){
            var floorcount = 0;
            if(global.grid[# xx+1, yy] == FLOOR) floorcount++;
            if(global.grid[# xx-1, yy] == FLOOR) floorcount++;
            if(global.grid[# xx, yy+1] == FLOOR) floorcount++;
            if(global.grid[# xx, yy-1] == FLOOR) floorcount++;
            if(global.grid[# xx+1, yy+1] == FLOOR) floorcount++;
            if(global.grid[# xx-1, yy-1] == FLOOR) floorcount++;
            if(global.grid[# xx-1, yy+1] == FLOOR) floorcount++;
            if(global.grid[# xx+1, yy-1] == FLOOR) floorcount++;
            
            var voidcount = 0;
            if(global.grid[# xx+1, yy] == VOID) voidcount++;
            if(global.grid[# xx-1, yy] == VOID) voidcount++;
            if(global.grid[# xx, yy+1] == VOID) voidcount++;
            if(global.grid[# xx, yy-1] == VOID) voidcount++;
            if(global.grid[# xx+1, yy+1] == VOID) voidcount++;
            if(global.grid[# xx-1, yy-1] == VOID) voidcount++;
            if(global.grid[# xx-1, yy+1] == VOID) voidcount++;
            if(global.grid[# xx+1, yy-1] == VOID) voidcount++;
            
            if(floorcount >= 5 && global.grid[# xx, yy] == VOID){
                global.grid[# xx, yy] = FLOOR;
            }else if(voidcount >= 6 && global.grid[# xx, yy] == FLOOR){
                global.grid[# xx, yy] = VOID;
            }
        }
    }
}
