# epldata
Datasets from English Premier League 1992-2018

This package is a basically repository of datasets relating to Football (soccer) English Football League from its inception through to the end of the 2017/18 season. The intention is to update it annually shortly after the season ends

None of the data is official and there are sure to be a few errors. Some data e.g. transfer fees are estimates

There are nine data sets in principle, if not in practice, based around the SQL concept of.... The data has been compiled over more than 25 years so has some bad practices built-in which should not detract from usage unduly

A lot of joins between tables are necessary and you may find it useful to create derived data.frames if you plan to use the data extensively. An example will be covered in a Vignette

I have included a couple of example functions within the package

## Suggested packages

In order to make full use of the data you may want to consider the following packages which epldata does not depend on

 * tidyverse - for a full range of data-manipulation
 * DT - for tabular presentation
 * plotly - for interactive charts
 * shiny - 
 * rMarkdown - 
 
There are many others to many to mention which I have used on a less frequent basis 


## Usage

Although, the data is a spartan, the availability of so many rich packages and the
quantity of data mean that output is really up to the imagination of the developer

### Personal

 * [premiersoccerstats.com](www.premiersoccerstas.com)  A shiny website updated after each round of matches allowing a unique wealth of tables and charts to be produced for any player or team
 
 * [twitter]() Typically 2-3 times a week I do some coding on a current topic and post a tweet often with an accompanying table or chart
 
 * [Blog](www.mytinyshinys.com) For the 2017/18 season, I produced a weekly post based on the latest round of games. It included a couple of in-depth analyses with code as well as trivia
 
 * [2017/18 Annual} Based around the abovementioned blog posts - but with additional  end of season comments for each round -  I have plans to produce what may well be the first interactive Sport Annual
 
 ### Others
 
 Please let me know if you publish anything and I will list it here
 
 ## Comaprable data
 
 I am not aware of any comparable non-commercial data. I was collecting certain aspects of the data including assists and goal descriptions well before any official collection
 
  The engsoccerdata package by authored and maintained by James Curley makes a good complement. It has a far broader scope both temorally and geographically as it provides 
  league match results for many of the English divisions back into the 19th Century as well as the leading leagues of many other nations. it also includes Cup data. 
  Howvere, it does not have the depth of this package with no player or goal information
  
 ## Installation
 
 Currently the package is not on CRAN

```
# Install from GitHub
devtools::install_github("pssguy/epldata")

# View datasets
 data(package="epldata")

```

### Future development

  * There are definitely some factual errors. If you find any please raise in issues
  * I have no plans to extend the data incorporated. However anyone collecting ...
  * It is possible I may add som e functions but that is not the main purpos
  * Although the data will be collated every week the plan is to update after every season
  * If anyonw wants to develop commercially please get in touch at agcur@rogers.com
  
  

