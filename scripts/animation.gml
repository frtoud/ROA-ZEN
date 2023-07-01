// make the nametag go higher while ustrong's fist is raised
if is_attacking() && attack == AT_USTRONG && window > 2 && !(window == 4 && window_timer > get_window_end() / 2){
	hud_offset = lerp(hud_offset, 180, 0.5);
}

// fix weird jittering that can happen when it tries to return to 0
if abs(hud_offset) < 1{
	hud_offset = 0;
}

if (get_gameplay_time() % 2 == 0) && zenith_active
{
    spawn_twinkle(zenith_particle, x, y-60, 80)
}

#define is_attacking()
return state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR

#define get_window_end()
{
    return get_window_value(attack, window, AG_WINDOW_LENGTH) - 1
}

//===========================================================
#define spawn_twinkle(vfx, pos_x, pos_y, width)
{
    //THXNOZ
    var kx = pos_x - (width / 2) + random_func(1, 1, false) * width;
    var ky = pos_y - (width / 2) + random_func(2, 1, false) * width;
     
    var k = spawn_hit_fx(floor(kx), floor(ky), vfx);
}