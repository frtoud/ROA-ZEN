//hit_player.gml


//====================================================
// Sephiroth-Zenith mode "install": points deduced for inflicting damage
zenith_points -= zenith_pointloss_mult * (my_hitboxID.damage * hit_player_obj.damage_scaling);
if (zenith_points < 0)
{
    zenith_points = 0;
    zenith_active = false;
}