/// @description Kill / Game Over
lives--;

if (lives == 0)
	change_state(game_state.lose, choose("GAME OVER!", "gg"), seconds(5));
else
	change_state(game_state.spawn, choose("Oh Snap!", "Watch out!", "Be careful!", "REKT!"), -1);

instance_destroy();