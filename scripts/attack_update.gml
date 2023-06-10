//B - Reversals
switch(attack){
	case AT_NSPECIAL:
	case AT_FSPECIAL:
	case AT_DSPECIAL:
	case AT_USPECIAL:
		trigger_b_reverse();
		break;
}



// per-attack logic

switch(attack){
    // give your moves some "pop" by spawning dust during them!
    case AT_JAB:
        break;
    case AT_FTILT:
        break;
    case AT_DTILT:
        break;
    case AT_UTILT:
        break;
    case AT_DATTACK:
        //gatling-cancel
        can_ustrong = (window == 2) && (has_hit && !was_parried);
        break;
    case AT_FSTRONG:
        break;
    case AT_USTRONG:
        break;
	
	
	
	case AT_NSPECIAL:
	    break;
	
	
	
	case AT_FSPECIAL:
		can_move = false;
		can_fast_fall = false;
		switch(window){
			case 1:
				hsp *= 0.5;
				vsp *= 0.5;
				if window_timer == get_window_end()
                {
					hsp = 35 * spr_dir;
				}
				break;
			case 2:
				vsp = 0;
				can_wall_jump = true;
				if (special_pressed){
					window = 3;
					window_timer = 0;
					destroy_hitboxes();
				}
				break;
			case 3:
				hsp *= 0.5;
				// vsp *= 0.5;
				can_wall_jump = true;
				break;
		}
		break;
	
	
	
	case AT_USPECIAL:
		can_move = false;
		can_fast_fall = false;
		can_wall_jump = true;
		fall_through = true;
		switch(window){
			case 1: // startup
				hsp = 0;
				vsp = 0;
				if window_timer == get_window_end()
                {
					vsp = -5;
				}
				break;
			case 2: // flight
				if (!joy_pad_idle){
					hsp += lengthdir_x(1, joy_dir);
					vsp += lengthdir_y(1, joy_dir);
				} else {
					hsp *= .6;
					vsp *= .6;
				}
				var fly_dir = point_direction(0,0,hsp,vsp);
				var fly_dist = point_distance(0,0,hsp,vsp);
				var max_speed = 10; // 12
				if (fly_dist > max_speed){
					hsp = lengthdir_x(max_speed, fly_dir);
					vsp = lengthdir_y(max_speed, fly_dir);
				}
				break;
			case 3: // atk startup
			case 4: // atk active
			case 5: // endlag
				hsp = 0;
				vsp = 0;
				break;
		}
		break;
	
	
	
	case AT_DSPECIAL:
		if (!hitpause && !was_parried && has_hit){
			can_jump = true;
		}
		can_fast_fall = false;
		can_move = false;
		break;
	
	
	
	case AT_TAUNT:
		break;
}

#define get_window_end()
{
    return get_window_value(attack, window, AG_WINDOW_LENGTH) - 1
}

#define spawn_base_dust // written by supersonic
/// spawn_base_dust(x, y, name, dir = 0)
///spawn_base_dust(x, y, name, ?dir)
//This function spawns base cast dusts. Names can be found below.
var dlen; //dust_length value
var dfx; //dust_fx value
var dfg; //fg_sprite value
var dfa = 0; //draw_angle value
var dust_color = 0;
var x = argument[0], y = argument[1], name = argument[2];
var dir = argument_count > 3 ? argument[3] : 0;

switch (name) {
	default: 
	case "dash_start":dlen = 21; dfx = 3; dfg = 2626; break;
	case "dash": dlen = 16; dfx = 4; dfg = 2656; break;
	case "jump": dlen = 12; dfx = 11; dfg = 2646; break;
	case "doublejump": 
	case "djump": dlen = 21; dfx = 2; dfg = 2624; break;
	case "walk": dlen = 12; dfx = 5; dfg = 2628; break;
	case "land": dlen = 24; dfx = 0; dfg = 2620; break;
	case "walljump": dlen = 24; dfx = 0; dfg = 2629; dfa = dir != 0 ? -90*dir : -90*spr_dir; break;
	case "n_wavedash": dlen = 24; dfx = 0; dfg = 2620; dust_color = 1; break;
	case "wavedash": dlen = 16; dfx = 4; dfg = 2656; dust_color = 1; break;
}
var newdust = spawn_dust_fx(x,y,asset_get("empty_sprite"),dlen);
if newdust == noone return noone;
newdust.dust_fx = dfx; //set the fx id
if dfg != -1 newdust.fg_sprite = dfg; //set the foreground sprite
newdust.dust_color = dust_color; //set the dust color
if dir != 0 newdust.spr_dir = dir; //set the spr_dir
newdust.draw_angle = dfa;
return newdust;