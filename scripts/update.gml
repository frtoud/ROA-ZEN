//update.gml

//====================================================
// Sephiroth-Zenith mode "install"

//TODO: detect Abyss mode & assume score-advantage of zero, fixed opponent percent
//TODO: alone in practice mode, wat do? (possible division by zero)
if (!zenith_was_activated) 
&& (zenith_last_known_percent < get_player_damage(player))
{
    var my_team = get_player_team(player);
    var opponent_score = 0;
    var opponent_percent = 0;
    var num_opponents = 0;
    with (oPlayer) if (get_player_team(player) != my_team)
    {
        opponent_score += get_player_stocks(player);
        opponent_percent += get_player_damage(player);
        num_opponents++;
    }

    //average advantage
    opponent_score = floor(opponent_score / num_opponents);
    opponent_percent = floor(opponent_percent / num_opponents);

    //check if own percent is above "danger treshold" (simplifaction of Sephiroth's)
    var score_diff = clamp(get_player_stocks(player) - opponent_score, -2, 2) //positive when you have the advantage
    var treshold = clamp(60 + (opponent_percent/5) - (score_diff*10), 80, 120) + (score_diff * 5);
    if (get_player_damage(player) > treshold)
    {
        sound_play(zenith_activation_sound);
        print("ZENITH TRIGGER")
        zenith_active = true;
        zenith_was_activated = true;
        zenith_points = 60 - (score_diff * 10);
    }
}
zenith_last_known_percent = get_player_damage(player);