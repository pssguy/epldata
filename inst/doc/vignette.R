## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  warning = FALSE,
  message = FALSE,
  comment = "#>"
)

## ------------------------------------------------------------------------

# Download package if not on your system
#devtools::install_github("pssguy/epldata")
library(epldata)

## This lists the available datasets with a brief description
data(package="epldata")

        


## ------------------------------------------------------------------------

library(tidyverse) # for data manipulation

glimpse(players)


## ------------------------------------------------------------------------

players %>% 
  filter(birth_date>"1989-12-31") %>% 
  group_by(birth_country) %>% 
  tally() %>% 
  mutate(pc=round(100*n/sum(n),2)) %>% 
  arrange(desc(pc))




## ------------------------------------------------------------------------

player_goals <- players %>% 
  left_join(player_team) %>% 
  left_join(player_game) %>% 
  right_join(goals) %>% 
  mutate(name=paste(first_name,last_name)) %>% 
  group_by(player_id,name,team) %>% 
  tally() %>% 
  arrange(desc(n)) %>% 
  group_by(team) %>% 
  slice(1) %>% 
  ungroup() %>% 
  filter(!(is.na(team))) %>% 
  select(team,name,goals=n)
  
  

player_goals



## ------------------------------------------------------------------------

## goals by team for individual match

goals_by_team <- game_team %>% 
  left_join(player_game) %>% 
  right_join(goals) %>% 
  # sum goals for each team for each game
  group_by(team,team_game_id,game_id) %>% 
  tally() %>% 
  # need to include games in which no goals were scored by team
  right_join(game_team) %>% 
  mutate(GF=ifelse(is.na(n),0,n)) %>% 
  select(-c(venue,n))

goals_by_team


## ------------------------------------------------------------------------
goals_by_game <-goals_by_team %>% 
  inner_join(goals_by_team,by="game_id") # specify otherwise it will also use team_game_id

head(goals_by_game)

## ------------------------------------------------------------------------

match_summary <- goals_by_game %>% 
  filter(team.x!=team.y) %>% 
  select(team=team.x,team_game_id=team_game_id.x,game_id,GF=GF.x,opponents=team.y,GA=GF.y) %>% 
  mutate(points=case_when(
       GF >GA  ~ 3,
       GF==GA ~ 1,
       GF<GA ~ 0
    
  ))

match_summary

## ------------------------------------------------------------------------

years <- c(1992:2018)

    
library(lubridate) # for date manipulation

match_summary_full <- match_summary %>% 
  left_join(games) %>% 
  mutate(year=year(game_date),month=month(game_date)) %>% 
  mutate(season= case_when(
    month<=7 ~ paste(year-1,year,sep="/"),
    month>7 ~ paste(year,year+1,sep="/")
         )
  ) %>% 
  arrange(game_date) %>% 
  group_by(season,team) %>% 
  mutate(year_game_order=row_number())
    
 match_summary_full

## ------------------------------------------------------------------------

standings <- match_summary_full %>% 
  select(team,season,game_date,year_game_order,GF,GA,points) %>% 
  group_by(team,season) %>% 
  mutate(cum_points=cumsum(points),cum_GF=cumsum(GF),cum_GA=cumsum(GA),cum_GD=cum_GF-cum_GA) %>% 
  group_by(season,year_game_order) %>% 
  arrange(desc(cum_points),desc(cum_GD),desc(cum_GF),team) %>% 
  mutate(position=row_number()) %>% 
  select(season,team,round=year_game_order,position,GF=cum_GF,GA=cum_GA,GD=cum_GD,points=cum_points) %>% 
  ungroup() # important otherwise scres up later inc animation

standings


## ------------------------------------------------------------------------

table_year_round <- function(x,y){
  standings %>% 
    filter(season==x,round==y)
}

table_year_round("1994/1995",20)


## ------------------------------------------------------------------------

match_summary_full %>% 
  ungroup() %>%  #match_summary_full is grouped tbl_df
  group_by(team,opponents) %>% 
  mutate(result = case_when(
    GF > GA ~ "W", #win
    GF == GA ~ "D", #draw/tie
    GF < GA ~ "L" # loss
  )) %>% 
  select(team,opponents,result,GF,GA,points) %>%
  mutate(yesno = 1) %>%
  distinct %>%
  spread(result, yesno, fill = 0) %>% 
  summarize(P=n(),W=sum(W),D=sum(D),L=sum(L),ppg=round(sum(points)/P,2))%>%
  arrange(desc(ppg)) %>% 
   DT::datatable(class='compact stripe hover row-border order-column',rownames=FALSE,options= list(paging = TRUE, searching = TRUE,info=FALSE))




## ----message = FALSE-----------------------------------------------------

player_game_data <- function(player) {
# collect goal information for specific player
df_goals <- players %>% 
  left_join(player_team) %>% 
  left_join(player_game) %>% 
  left_join(goals) %>% 
  filter(start==TRUE|time_on>0) %>% 
  select(player_id,last_name,player_game_id,goal_id,team_game_id) %>% 
  mutate(goal=ifelse(!is.na(goal_id),1,0)) %>% 
  group_by(player_id,last_name,team_game_id) %>% 
  summarize(tot_goals=sum(goal)) %>% 
   filter(player_id==player)

# likewise with assists
df_assists <- players %>% 
  left_join(player_team) %>% 
  left_join(player_game) %>% 
  left_join(assists) %>% 
  filter(start==TRUE|time_on>0) %>% 
  select(player_id,last_name,team_game_id,assist_id,player_game_id) %>% 
  mutate(assist=ifelse(!is.na(assist_id),1,0)) %>% 
  group_by(player_id,last_name,team_game_id) %>% 
  summarize(tot_assists=sum(assist)) %>% 
   filter(player_id==player)

# combine
df_all <- df_goals %>% 
  inner_join(df_assists) %>% 
# create a game order  
  left_join(game_team) %>%
  left_join(games) %>% 
  arrange(game_date) %>% 
  mutate(player_game_order=row_number()) %>% 
   ungroup() %>% #removes unwanted name and PLAYERID
  select(player_game_order,tot_goals,tot_assists) %>% 
  # gather into narrow format for plotting
  gather(category,count,-player_game_order) 


}

player_df <-player_game_data("SALAHM")
head(player_df)




## ---- message = FALSE----------------------------------------------------
library(plotly)

player_df %>%
  plot_ly(x=~player_game_order, y= ~count,width = 600) %>%
  add_bars(color= ~category, colors=c("red","blue")) %>%
  layout(barmode="stack")


## ---- eval = FALSE-------------------------------------------------------
#  
#  library(shiny)
#  library(glue)
#  
#  shinyApp(
#  
#  
#  
#    ui = fluidPage(
#  
#      ## calculate an ordered vector of teams to  select from
#       teams <- match_summary_full %>%
#        pull(team) %>%
#        unique() %>%
#        sort(),
#  
#      selectInput("team", "Select Team:", teams),
#  
#      plotlyOutput("goals_for")
#    ),
#    server = function(input, output) {
#  
#      output$goals_for <- renderPlotly({
#  
#        match_summary_full %>%
#          filter(team == input$team) %>%
#          plot_ly %>%
#          add_histogram(x =  ~ GF) %>%
#          layout(title = glue("Distribution of Goals scored by {input$team}"))
#  
#      })
#    }
#  )
#  
#  

## ---- warning = FALSE----------------------------------------------------
library(crosstalk)

msf  <- SharedData$new(match_summary_full)
bscols(
  widths = c(12), # forces components into rows
filter_select(id="team",label="Select a Team",sharedData=msf, group =  ~team, multiple = FALSE),
plot_ly(msf, x = ~GF, showlegend = FALSE, width=600) %>% 
    add_histogram(color = ~team, colors = "red")
)

## ----animation-----------------------------------------------------------

# function to add cumulative line
# courtesy Carson Sievert

accumulate_by <- function(dat, var) {
  var <- lazyeval::f_eval(var, dat)
  lvls <- plotly:::getLevels(var)
  dats <- lapply(seq_along(lvls), function(x) {
    cbind(dat[var %in% lvls[seq(1, x)], ], frame = lvls[[x]])
  })
  dplyr::bind_rows(dats)
}

# select team(s) to display 
teams <- c("Brighton","Crystal P")

# add function to base data and year of interest
df <- standings %>% 
  filter(season=="2017/2018"&team %in% teams) %>% 
  accumulate_by(~round)

# static plot - scatter plot- uncolored
base <- df %>% 
  plot_ly(x=~round,y=~position,width=600) %>% 
layout(
    xaxis=list(title="Games Played"),
   yaxis=list(title="League Standing",range=c(20.5,0.5))
  ) %>% 
  config(displayModeBar = F,showLink = F) 


# add animation options and color-blind safe colors
 base %>%
   add_lines(color = ~team, colors="Set2", frame = ~frame, ids = ~team) %>%
  animation_opts(500, easing = "linear",mode='immediate') %>%
  animation_button(
    x = 1, xanchor = "right", y = 0, yanchor = "middle", font = list(color="red"), bgcolor="lightblue"
  ) %>%
  animation_slider(
    currentvalue = list(prefix = "Game ")
  ) 


