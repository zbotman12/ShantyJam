switch (mpos)
{
    case 0:
    {   
        goToLevel = true;
        break;
    }
    case 1: 
        {
        room_goto(controls)
        break;
        }
    case 2: 
        {
        room_goto(credits)
        break;
        } 
        
    case 3: game_end(); break;
    default: break;
}   
