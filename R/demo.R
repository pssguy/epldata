## this should make data available in data folder
## I have calculated this annually wihin the epl project
## should be updated after every season

players <- readRDS("data-raw/players.rds")
usethis::use_data(players,overwrite = TRUE)
## yep works fine 88.6kb # but creates an rda rather than RData file??

## repeat for all
assists <- readRDS("data-raw/assists.rds")
goals <- readRDS("data-raw/goals.rds")
manager_team <- readRDS("data-raw/manager_team.rds")
managers <- readRDS("data-raw/managers.rds")
game <- readRDS("data-raw/game.rds")
game_team <- readRDS("data-raw/game_team.rds")
player_game <- readRDS("data-raw/player_game.rds")
player_team <- readRDS("data-raw/player_team.rds")
players <- readRDS("data-raw/players.rds")

usethis::use_data(assists,overwrite = TRUE)
usethis::use_data(goals,overwrite = TRUE)
usethis::use_data(manager_team,overwrite = TRUE)
usethis::use_data(managers,overwrite = TRUE)
usethis::use_data(game,overwrite = TRUE)
usethis::use_data(game_team,overwrite = TRUE)
usethis::use_data(player_game,overwrite = TRUE)
usethis::use_data(player_team,overwrite = TRUE)
usethis::use_data(players,overwrite = TRUE)



## restart R

## now do a test function

# this will no work presumably until package has been created
#players <- data(players)


# this does work
# players <- load("data/players.rda") #"players
# data(players) # provides dataframe
#
# ## calc number of players by country
#
# names(goals) ## didnt load just used



library(dplyr)
data(players)
data(player_team)
data(player_game)
data(goals)
data(game_team)
data(game)

player_scoring_method <- function(id) {

  players %>%
  filter(player_id==id) %>%
  left_join(player_team) %>%
  left_join(player_game) %>%
  inner_join(goals) %>%
  count(method)
}

res <-player_scoring_method("ZAHAW")


## would  be useful to have seasons

# years <- c(1992:2018)
# playerGame$season <- as.character(cut(playerGame$gameDate,  breaks=as.Date(paste(years,"-08-01",sep="")),  labels=paste(years[-length(years)],str_sub(years[-length(years)]+1,3,4),sep="/")))
# match$season <- as.character(cut(match$gameDate,  breaks=as.Date(paste(years,"-08-01",sep="")),  labels=paste(years[-length(years)],str_sub(years[-length(years)]+1,3,4),sep="/")))

## apperances by season by team

# names(player_team)
# names(player_match)

library(dplyr)


player_team_starts <- function(club,startDate,endDate){

  player_game %>%
  left_join(game_team) %>%
  left_join(game) %>%
  left_join(player_team) %>%
  left_join(players) %>%
  filter(start==TRUE,team==club,
         between(game_date,as.POSIXct(startDate),as.POSIXct(endDate)))   %>%
  count(player_id,last_name, sort=TRUE) %>%
  ungroup() %>%
  select(last_name,starts=n)
}

player_team_starts("Chelsea","2017-08-01","2018-08-01")

