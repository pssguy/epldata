# epldata
Datasets of the English Premier League 1992-2018

This package is a repository of datasets relating to Football (soccer) English Football League from its inception in August 1992 through to the end of the 2017/18 season. The intention is to update it annually shortly after each season ends in May

None of the data is official and there are sure to be a few, hopefully trivial, errors. Some data e.g. transfer fees are estimates

There are nine data sets loosely structured around the idea of a relational SQL database. So no duplicated data and lots of joins required to make full use of the figures. The data has been compiled over more than 25 years so has some bad practices built-in bur these should not detract from usage unduly
   
  1. assists - ids of one or two players assisting each goal
  2. game - game id, date, attendance, referee
  3. game_team - team name,venue for each game id
  4. goals - player_game id, details of method, place and play 
  5. manager_team - joining and leaving dates of managers at each team
  6. managers - manager name and id
  7. player_game - player_team and team_game ids, whether starter, time on and off, cautions,
       own-goals and missed penalties
  8. player_team - date of joining and leaving team, transfer fees involved, whether on-loan
  9. players - first and last name, place and date of birth, field position
  
## Installation
 
 Currently the package is not on CRAN

```
# Install from GitHub
devtools::install_github("pssguy/epldata")

# View datasets and functions
 help(package="epldata")
 
# Load dataset
 library(epldata)
 data(players)

```  

A lot of joins between tables are necessary and you may find it useful to create derived data.frames if you plan to use the data extensively. Examples are covered in the Vignette

I have included a couple of example functions within the package

## Suggested packages

In order to make full use of the data you may want to consider the following packages which epldata does not depend on

 * tidyverse - for a full range of data-manipulation
 * DT - for tabular presentation
 * plotly - for info-active charts
 * shiny & crosstalk - for user interactivity
 * rMarkdown - for blogs/articles/books/presentations
 
There are many others - too many to mention - which I have used on a less frequent basis 


## Usage

Although, the data is a basic information, the availability of so many rich packages and the quantity of data mean that a wide range of output in terms of both form and content is possible and really depends on the imagination of the developer. I have included some examples in a [vignette](https://github.com/pssguy/epldata/blob/master/vignettes/basics.Rmd) but there are far more output examples, with code, based on derived tables on the [mytinyshinys blog](http://mytinyshinys.com/categories/eplweekly/)

 It can be used as a fun way to introduce students to coding in R and  producing visualizations  using data related to probably the most popular world wide Sports League
 
 Other uses might include
 
 * fantasy leagues
 * team/player analyses
 * betting 
 * personal curiosity
 * fan trivia
 
 Here are some real-world examples of the output

### Personal

 * [premiersoccerstats.com](http://www.premiersoccerstats.com)  A shiny website updated after each round of matches allowing a unique wealth of tables and charts to be produced for any player or team
 
 ![](/img/example_pss.PNG)
 
 ---
 
 * [twitter](https://twitter.com/pssGuy) Typically 2-3 times a week I do some coding on a current topic and post a tweet often with an accompanying table or chart
 
 ![](img/example_tweet.PNG)
 
---
 
 * [Blog](http://www.mytinyshinys.com)    
 During the 2017/18 season, I produced a weekly post based on each of the 38 rounds of games. It included a couple of in-depth analyses, with code, as well as trivia and related externally produced game highlight videos and podcasts
 
  ![](img/example_blog.png)
 
---
 
 * [2017/18 Annual - under development]() Based around the above-mentioned blog posts - but with additional  end of season comments for each week -  this will be a rare, if not unique,  Interactive Sports Annual
 
  ![](img/example_book.png)
 
---
 
### Others
 
 Please let me know of any interesting usage of the package and I will list them here
 
 ---
 
 
## Comparable data
 
 I am not aware of any comparable non-commercial data. I was collecting certain aspects of the data including assists and goal descriptions well before any official adaptation
 
  The [engsoccerdata package](https://github.com/jalapic/engsoccerdata) authored and maintained by James Curley makes a good complement. It has a far broader scope both temporally and geographically as it provides 
  league match results for many of the English divisions back into the 19th Century as well as the leading leagues of many other nations. it also includes Cup data. 
  However, it does not have the depth of this package with no player or goal information
  
  Examples of open-source datasets in other sports fields include the [lahman baseball database ](https://github.com/cdalzell/Lahman) and the [deuce tennis package](https://github.com/skoval/deuce)


## Future development

  * If you find any factual errors e.g goal designations please raise in issues
  * I have no current plans to extend the type of data covered. However, anyone collecting           complementary information  e.g. chances created and wishes to incorporate them in this package please get in touch
  * It is possible I may add some functions but that is not the main purpose. The [vignette] (https://github.com/pssguy/epldata/blob/master/vignettes/basics.Rmd) already provides some code and may be added to over time
  * Although the raw data will be collated every week the plan is to update this package after every season
  * If anyone wants to develop commercially please get in touch at agcur@rogers.com
  
## Acknowledgements


  
I would like to thank my brother, Stuart Clark, for providing all the goal and assist data for many years
Also the [soccerbase web site](www.soccerbase.com) has been a great reference source
    
In addition, the developers and maintainers of all the R packages I have used; pride of place going to the RStudio team and Carson Sievert for the, ropensci, plotly package
  
  

