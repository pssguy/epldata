#' total goals a player has scored with right foot, left-foot or header
#'
#' @param id player_id
#' @return a dataframe of goals by scoring method
#' @importFrom magrittr %>%
#' @importFrom dplyr filter left_join inner_join count
#' @examples
#' player_scoring_method("KANEH")
#' player_scoring_method("SHEAREA")
#' @export



player_scoring_method <- function(id) {

  players %>%
    filter(player_id==id) %>%
    left_join(player_team) %>%
    left_join(player_game) %>%
    inner_join(goals) %>%
    count(method)
}


