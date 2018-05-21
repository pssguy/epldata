#' Premier League players 1992-2018
#'
#' Basic data for all players who have appeared in
#' the Premier League. May include some on rosters
#' who never played
#'
#'
#'
#' @format A data frame with 4690 rows and 7 variables:
#' \describe{
#'   \item{player_id}{Unique Player ID}
#'   \item{first_name}{First name - may be blank}
#'   \item{last_name}{Last name - may be nickname e.g Juninho}
#'   \item{birth_date}{Birth Date}
#'   \item{birth_city}{Town or City of birth, if known}
#'   \item{birth_country}{Country of Birth - not nationality}
#'   \item{position}{Usual Playing Position G-Goalkeeper, D-Defender, M-Midfielder, F-Forward}
#' }
"players"


#' Player by Team
#'
#' Player details by team they played for including dates with
#' team and transfer fees
#'
#'
#' @format A data frame with 7109 rows and 8 variables:
#' \describe{
#'   \item{player_id}{Unique Player ID}
#'   \item{player_joined}{Date first signed - estimated for academy players}
#'   \item{player_left}{Date player was transferred or became free agent}
#'   \item{permanent}{1 - Permanent, 0 - On-loan}
#'   \item{fee_in}{Fee paid on transfer in  in 1000 pounds. Could be best estimate. 99 - unknown}
#'   \item{fee_out}{Fee paid on transfer out in 1000 pounds. Could be best estimate. 99 - unknown}
#'   \item{player_team_id}{Unique ID for Player's stint on Team}
#'   \item{team}{Team name}
#'
#'   }
"player_team"


#' Assists
#'
#' Dataset of Assists for Goals (maximum 2 per goal)
#'
#' @format A data frame with 34050 rows and 3 variables:
#' \describe{
#'   \item{player_game_id}{Player Game ID of Assister}
#'   \item{goal_id}{Goal which Assist was provided for}
#'   \item{assist_id}{Unique id of assist}
#'
#' }
"assists"

#' Managers
#'
#' Dataset of Managers
#'
#'
#' @format A data frame with 224 rows and 2 variables:
#' \describe{
#'   \item{manager_id}{Unique Manager ID}
#'   \item{manager_name}{Manager's name}
#' }
"managers"

#' Goals
#'
#' Dataset of Goals including information on time scored, method
#' place and play
#'
#' @format A data frame with 26784 rows and 6 variables:
#' \describe{
#'   \item{player_game_id}{Unique Player Game ID of Scorer}
#'   \item{time}{time in game. Added time at end of each half is included in 45 and 90 minute figure }
#'   \item{method}{Method. R - Right foot; L -  Left Foot; H - Head(or other body part)}
#'   \item{place}{Location on Pitch. G - 6 yard box; P - Others in Penalty Area; O - Outside Penalty area}
#'   \item{play}{Play. C - Corner; D - Direct Free Kick; I - Indirect FK; O - Open Play; P - Penalty; T - Throwin}
#' }
"goals"

#' Games by Team
#'
#' Dataset of Team games including venue
#'
#'
#' @format A data frame with 20252 rows and 4 variables:
#' \describe{
#'   \item{team_game_id}{Unique Team Game ID}
#'   \item{game_id}{Unique Game ID}
#'   \item{venue}{Stadium. A - Away; H - Home}
#'   \item{team}{Team name}

#' }
"game_team"


#' Game
#'
#' Basic information including, date, attendance and referee
#'
#'
#' @format A data frame with 10127 rows and 4 variables:
#' \describe{
#'   \item{game_date}{Date of game}
#'   \item{crowd}{Announced Attendance}
#'   \item{referee_name}{Initial and Last name}
#'   \item{game_id}{Unique Game ID}
#' }
"game"


#' Manager by Team
#'
#' Time period of manager's stint with team
#'
#'
#' @format A data frame with 367 rows and 5 variables:
#' \describe{
#'   \item{manager_joined}{Date of Hiring}
#'   \item{manager_left}{Date of Leaving}
#'   \item{manager_team_id}{Unique ID for Manager's stint on Team}
#'   \item{team}{Team name}
#'   \item{manager_id}{Unique Manager ID}
#'}
"manager_team"

#' Game by Player
#'
#' Individual Game details for player
#'
#'
#' @format A data frame with 330287 rows and 9 variables:
#' \describe{
#'   \item{player_game_id}{Unique Player Game ID}
#'   \item{team_game_id}{Team Game ID}
#'   \item{player_team_id}{Player Team ID}
#'   \item{time_off}{Time of game when substituted. 0 otherwise}
#'   \item{time_on}{Time of game entering as sub. ) otherwise}
#'   \item{caution}{Y - Yellow; P - 2 Yellows; R - Straight Red; Z Yellow then Red;
#'   otherwise NULL. N.B. Few odd values to resolve }
#'   \item{own_goals}{Scored on Own Team}
#'   \item{missed_penalties}{Missed a penalty. Follow-up goals not included}
#'   \item{start}{Starter in Game indicated by value > 0}
#' }
"player_game"

