#' most goals a team has scored in game
#'
#' @param id team
#' @return an integer of maximum goals scored in game
#' @importFrom magrittr %>%
#' @importFrom dplyr filter left_join count pull
#' @examples
#' team_max_game_score("Man. Utd.")
#' team_max_game_score("Barnsley")
#' @export



team_max_game_score <- function(id) {

goals %>%
    left_join(player_game) %>%
    left_join(player_team) %>%
    filter(team==id) %>%
    count(team_game_id, sort =  TRUE) %>%
    head(1) %>%
    pull(n)
}


