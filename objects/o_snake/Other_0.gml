/// @description Win
change_state(game_state.win, choose("Great Job!", "Nice Moves!", "Gratz!", "w1n!"), seconds(5));
instance_destroy();