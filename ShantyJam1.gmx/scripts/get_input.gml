var gamepadLeftHor  = false;
var gamepadLeftVert = false;
var gamepadAReleased = false;
var gamepadAPressed = false;
var gamepadBPressed = false;
var gamepadXPressed = false;
var gamepadYPressed = false;
var gamepadA = false;
var gamepadB = false;
var gamepadX = false;
var gamepadY = false;
var gamepadDpadUpReleased = false;
var gamepadDpadDownReleased = false;
var gamepadDpadLeftReleased = false;
var gamepadDpadRightReleased = false;
var gamepadDpadUp = false;
var gamepadDpadDown = false;
var gamepadDpadLeft = false;
var gamepadDpadRight = false;
var gamepadStart = false;
var gamepadLT = false;
var gamepadRightHor = false;
var gamepadRightVert = false;
var thumbstickReleaseLHor = 0;
var thumbstickReleaseRHor = 0;
var thumbstickReleaseLVert = 0;
var thumbstickReleaseRVert = 0;

if (gamepad_is_connected(0)) //Maybe we want any controller, 0 - 3, to work, just a thought.
{ 
    gamepad_set_axis_deadzone(0, 0.5);
    gamepadLeftHor = sign(gamepad_axis_value(0, gp_axislh));
    gamepadLeftVert = sign(gamepad_axis_value(0, gp_axislv));
    gamepadRightHor = sign(gamepad_axis_value(0, gp_axisrh));
    gamepadRightVert = sign(gamepad_axis_value(0, gp_axisrv));
    //Thumbstick Directional Release inputs
    //If the the direction pressed last frame does not equal the direction
    //Pressed this frame on any given axis, then we know that the axis
    //was released.
    thumbstickReleaseLHor = (lastDirTSLHor != gamepadLeftHor);
    thumbstickReleaseRHor = (lastDirTSRHor != gamepadRightHor);
    thumbstickReleaseRVert = (lastDirTSRVert != gamepadRightVert);
    thumbstickReleaseLVert = (lastDirTSLVert != gamepadLeftVert);
    lastDirTSRHor = gamepadRightHor;
    lastDirTSLHor = gamepadLeftHor;
    lastDirTSRVert = gamepadRightVert;
    lastDirTSLVert = gamepadLeftVert;
    //FACEBUTTONS 
    gamepadAReleased = gamepad_button_check_released(0, gp_face1);
    gamepadAPressed = gamepad_button_check_pressed(0, gp_face1);
    gamepadBPressed = gamepad_button_check_pressed(0, gp_face2);
    gamepadXPressed = gamepad_button_check_pressed(0, gp_face3);
    gamepadYPressed = gamepad_button_check_pressed(0, gp_face4);
    gamepadA = gamepad_button_check(0, gp_face1);
    gamepadB = gamepad_button_check(0, gp_face2);
    gamepadX = gamepad_button_check(0, gp_face3);
    gamepadY = gamepad_button_check(0, gp_face4);

    //DPAD
    gamepadDpadUpReleased = gamepad_button_check_released(0, gp_padu);
    gamepadDpadDownReleased = gamepad_button_check_released(0, gp_padd);
    gamepadDpadLeftReleased = gamepad_button_check_released(0, gp_padl);
    gamepadDpadRightReleased = gamepad_button_check_released(0, gp_padr);
    gamepadDpadUp = gamepad_button_check(0, gp_padu);
    gamepadDpadDown = gamepad_button_check(0, gp_padd);
    gamepadDpadLeft = gamepad_button_check(0, gp_padl);
    gamepadDpadRight = gamepad_button_check(0, gp_padr);
    
    gamepadStart = gamepad_button_check_pressed(0, gp_start);
    gamepadLT = gamepad_button_check(0, gp_shoulderlb);
    
}
    
//Keyboard Inputs
var keyboardMbLeft = mouse_check_button_pressed(mb_left);
var keyboardMbLeftReleased = mouse_check_button_released(mb_left);
var keyboardRight = keyboard_check(ord("D"));
var keyboardLeft = keyboard_check(ord("A"));
var keyboardUp = keyboard_check(ord("W"));
var keyboardUpPressed = keyboard_check_pressed(ord("W"));
var keyboardDown = keyboard_check(ord("S"));
var keyboardDownPressed = keyboard_check_pressed(ord("S"));
var keyboardShift = keyboard_check(vk_lshift) || keyboard_check(vk_rshift);
var keyboardControl = keyboard_check(vk_control);
var keyboardControlPressed = keyboard_check_pressed(vk_control);
var keyboardJump = keyboard_check(vk_space);
var keyboardJumpPressed = keyboard_check_pressed(vk_space);
var keyboardJumpReleased = keyboard_check_released(vk_space);
var keyboardInteractPressed = keyboard_check_pressed(ord("E"));
var keyboardEscape = keyboard_check_pressed(vk_escape);
var keyboardArrowUp = keyboard_check(vk_up);
var keyboardArrowDown = keyboard_check(vk_down);
var keyboardArrowLeft = keyboard_check(vk_left);
var keyboardArrowRight = keyboard_check(vk_right);

/*if(keyboardMbLeft || 
keyboardRight || 
keyboardLeft ||
keyboardShift || 
keyboardControlPressed || 
keyboardJumpPressed ||
keyboardUpPressed ||
keyboardDownPressed ||
keyboardInteractPressed) gamepad = false;*/

leftClick = keyboardMbLeft || gamepadAPressed;
leftClickReleased = keyboardMbLeftReleased || gamepadAReleased;
right = keyboardRight || (gamepadLeftHor == 1);
left = keyboardLeft || (gamepadLeftHor == -1);
up = keyboardUp || (gamepadLeftVert == -1);
down = keyboardDown || (gamepadLeftVert == 1);
runButton = keyboardShift || gamepadLT;
crouchButton = keyboardControl || gamepadB;
crouchButtonPressed = keyboardControlPressed || gamepadBPressed;
jump = keyboardJump || gamepadA;
jumpReleased = keyboardJumpReleased || gamepadAReleased;
upPressed = keyboardUpPressed || (gamepadLeftVert == -1);
downPressed = keyboardDownPressed || (gamepadLeftVert == 1);
interactPressed =  keyboardInteractPressed || gamepadXPressed;
pauseButton = keyboardEscape || gamepadStart;
rightAndLeftPressed = right && left;

arrowUp = gamepadDpadUp || (gamepadLeftVert == -1);
arrowDown = gamepadDpadDown || (gamepadLeftVert == 1);
arrowLeft = gamepadDpadLeft || (gamepadLeftHor == -1);
arrowRight = gamepadDpadRight || (gamepadLeftHor == 1);
arrowUpRelease = gamepadDpadUpReleased || ((gamepadLeftVert == 0) && thumbstickReleaseLVert);
arrowDownRelease = gamepadDpadDownReleased || ((gamepadLeftVert == 0) && thumbstickReleaseLVert);
arrowLeftRelease = gamepadDpadLeftReleased || ((gamepadLeftHor == 0) && thumbstickReleaseLHor);
arrowRightRelease = gamepadDpadRightReleased || ((gamepadLeftHor == 0) && thumbstickReleaseLHor);
