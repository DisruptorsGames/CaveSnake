/// @description Init
title = "Cave Snake";
selection = 0;
indicator = ">";

menu = ds_list_create();
ds_list_add(menu, "Arcade");
ds_list_add(menu, "High Scores");
ds_list_add(menu, "Quit");

audio_stop_all();