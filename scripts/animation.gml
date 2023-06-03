// make the nametag go higher while ustrong's fist is raised
if is_attacking() && attack == AT_USTRONG && window > 2 && !(window == 4 && window_timer > get_window_end() / 2){
	hud_offset = lerp(hud_offset, 180, 0.5);
}

// fix weird jittering that can happen when it tries to return to 0
if abs(hud_offset) < 1{
	hud_offset = 0;
}

#define is_attacking()
return state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR

#define get_window_end()
{
    return get_window_value(attack, window, AG_WINDOW_LENGTH) - 1
}
