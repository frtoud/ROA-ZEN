//update.gml



with (pHitBox)
if (orig_player_id == other)
{
    hbox_num = other.last_hb
    attack = other.last_attack
    orig_player_id = other.last_hit_by
    //player_id = other.last_hit_by
    orig_player = other.last_hit_by.player
    //player = other.last_hit_by.player

    hbox_group = -1;
}