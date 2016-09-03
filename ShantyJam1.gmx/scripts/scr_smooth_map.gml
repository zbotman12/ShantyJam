///scr_smooth_map(numberOfTimes)

var numberOfTimes = argument0;

repeat(numberOfTimes){
    for(var yy = 1; yy < height - 1; yy++){
        for(var xx = 1; xx < width - 1; xx++){
        
            var voidcount = 0;
            if(grid[# xx+1, yy] == VOID) voidcount++;
            if(grid[# xx-1, yy] == VOID) voidcount++;
            if(grid[# xx, yy+1] == VOID) voidcount++;
            if(grid[# xx, yy-1] == VOID) voidcount++;
            if(grid[# xx+1, yy+1] == VOID) voidcount++;
            if(grid[# xx-1, yy-1] == VOID) voidcount++;
            if(grid[# xx-1, yy+1] == VOID) voidcount++;
            if(grid[# xx+1, yy-1] == VOID) voidcount++;
            
            if(voidcount == 0 && grid[# xx, yy] == FLOOR){
                grid[# xx, yy] = VOID;
            }
        }
    }
}

repeat(numberOfTimes - 1){
    for(var yy = 1; yy < height - 1; yy++){
        for(var xx = 1; xx < width - 1; xx++){
            var floorcount = 0;
            if(grid[# xx+1, yy] == FLOOR) floorcount++;
            if(grid[# xx-1, yy] == FLOOR) floorcount++;
            if(grid[# xx, yy+1] == FLOOR) floorcount++;
            if(grid[# xx, yy-1] == FLOOR) floorcount++;
            if(grid[# xx+1, yy+1] == FLOOR) floorcount++;
            if(grid[# xx-1, yy-1] == FLOOR) floorcount++;
            if(grid[# xx-1, yy+1] == FLOOR) floorcount++;
            if(grid[# xx+1, yy-1] == FLOOR) floorcount++;
            
            var voidcount = 0;
            if(grid[# xx+1, yy] == VOID) voidcount++;
            if(grid[# xx-1, yy] == VOID) voidcount++;
            if(grid[# xx, yy+1] == VOID) voidcount++;
            if(grid[# xx, yy-1] == VOID) voidcount++;
            if(grid[# xx+1, yy+1] == VOID) voidcount++;
            if(grid[# xx-1, yy-1] == VOID) voidcount++;
            if(grid[# xx-1, yy+1] == VOID) voidcount++;
            if(grid[# xx+1, yy-1] == VOID) voidcount++;
            
            if(floorcount >= 5 && grid[# xx, yy] == VOID){
                grid[# xx, yy] = FLOOR;
            }else if(voidcount >= 6 && grid[# xx, yy] == FLOOR){
                grid[# xx, yy] = VOID;
            }
        }
    }
}
