/// @function change_state
/// @param game_state
/// @param message
/// @param cooldown
var game = o_controller.game;
game.status = argument0;
game.message = argument1;
game.timer = argument2 == -1 
	? o_controller.cooldown 
	: argument2;
// ToDo: add bosses?
game.level++;