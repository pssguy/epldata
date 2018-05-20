# epldata
Datasets from English Premier League 1992-2018

This package is a basically repository of datasets relating to Football (soccer) English Football League from its inception in August 1992 through to the end of the 2017/18 season. The intention is to update it annually shortly after each season ends in May

None of the data is official and there are sure to be a few, opefully trivial, errors. Some data e.g. transfer fees are estimates

There are nine data sets loosely structured around the idea of a relation SQL database of The data has been compiled over more than 25 years so has some bad practices built-in which should not detract from usage unduly
   
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

Although, the data is a basic information, the availability of so many rich packages and the
quantity of data mean that a wide range of output in terms of both form and content is possible and really depends on the imagination of the developer.

 It can be used as a fun way to introduce students to coding in R and  producing visualizations
 using data related to probably the most popular world wide Sports League
 
 Use for fantasy leagues, team and player analyses, betting are all possibilities
 
 Here are some real-world examples of the output

### Personal

 * [premiersoccerstats.com](www.premiersoccerstas.com)  A shiny website updated after each round of matches allowing a unique wealth of tables and charts to be produced for any player or team
 
 * [twitter]() Typically 2-3 times a week I do some coding on a current topic and post a tweet often with an accompanying table or chart
 
 * [Blog](www.mytinyshinys.com) For the 2017/18 season, I produced a weekly post based on the latest round of games. It included a couple of in-depth analyses with code as well as trivia and related externally produced game highlight videos and podcasts
 
 * [2017/18 Annual - in development} Based around the above-mentioned blog posts - but with additional  end of season comments for each of the 38 rounds -  I have plans to produce what may well be the world's first interactive Sport Annual
 
 ### Others
 
 Please let me know of any examples of  and I will list them here
 
 ## Comaprable data
 
 I am not aware of any comparable non-commercial data. I was collecting certain aspects of the data including assists and goal descriptions well before any official adaptation
 
  The [engsoccerdata package] by authored and maintained by James Curley makes a good complement. It has a far broader scope both temporally and geographically as it provides 
  league match results for many of the English divisions back into the 19th Century as well as the leading leagues of many other nations. it also includes Cup data. 
  However, it does not have the depth of this package with no player or goal information
  
  An example of a comparable open-source in another sports field is the [lahman] baseball database 
  
 ## Installation
 
 Currently the package is not on CRAN

```
# Install from GitHub
devtools::install_github("pssguy/epldata")

# View datasets
 data(package="epldata")

```

### Future development

  * If you find any factual errors e.g gaol designations please raise in issues
  * I have no current plans to extend the type of data covered. However, anyone collecting           complementary information  e.g. chances created and wishes to incorporate them in this package please get in touch
  * It is possible I may add some functions but that is not the main purpose. The vignette already provides som e code and may be added to over time
  * Although the raw data will be collated every week the plan is to update this package after every season
  * If anyone wants to develop commercially please get in touch at agcur@rogers.com
  
## Acknowledgements
  
    I would like to thank my brother, Stuart, for providing all the goal and assist data for many years
    Also the [soccerbase web site](www.soccerbase.com) has been a great reference source
    
    In addition developers of all the R packages I have used. pride of place going to the RStudio team
    and Carson Sievert for the OpenScience plotly package
  
  

