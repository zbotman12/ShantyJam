///scr_flood_fill(targetNum, replacementNum, xx, yy)
targetNum = argument0;
replacementNum = argument1;
xx = argument2;
yy = argument3;

if(grid[# xx,yy] == replacementNum || grid[# xx,yy] != targetNum ) {
    return 1;
}

if(grid[# xx,yy] == targetNum){
    grid[# xx,yy] = replacementNum;
    if(!scr_flood_fill(targetNum,replacementNum, xx+1, yy))
    {
        return 1;
    }
    if(!scr_flood_fill(targetNum,replacementNum, xx-1, yy))
    {
        return 1;
    }
    if(!scr_flood_fill(targetNum,replacementNum, xx, yy+1))
    {
        return 1;
    }
    if(!scr_flood_fill(targetNum,replacementNum, xx, yy-1))
    {
        return 1;
    }
}
