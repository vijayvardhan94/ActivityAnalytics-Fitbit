date <- '2019-05-02';

# open the curl connection
hr.connection <- curl(
  paste0('https://api.fitbit.com/1/user/-/activities/heart/date/', date, '/1d/1min.json'), 
  handle = h
);

library(jsonlite);


hr.string <- readLines( hr.connection, warn = FALSE );

hr.content <- fromJSON( hr.string );
str(hr.content);

##r output 

## List of 2
##  $ activities-heart         :'data.frame':   1 obs. of  2 variables:
##   ..$ dateTime: chr "2017-12-25"
##   ..$ value   :'data.frame': 1 obs. of  3 variables:
##   .. ..$ customHeartRateZones:List of 1
##   .. .. ..$ : list()
##   .. ..$ heartRateZones      :List of 1
##   .. .. ..$ :'data.frame':   4 obs. of  5 variables:
##   .. .. .. ..$ caloriesOut: num [1:4] 1584 582 0 0
##   .. .. .. ..$ max        : int [1:4] 97 135 164 220
##   .. .. .. ..$ min        : int [1:4] 30 97 135 164
##   .. .. .. ..$ minutes    : int [1:4] 872 106 0 0
##   .. .. .. ..$ name       : chr [1:4] "Out of Range" "Fat Burn" "Cardio" "Peak"
##   .. ..$ restingHeartRate    : int 80
##  $ activities-heart-intraday:List of 3
##   ..$ dataset        :'data.frame':  978 obs. of  2 variables:
##   .. ..$ time : chr [1:978] "06:19:00" "06:20:00" "06:21:00" "06:22:00" ...
##   .. ..$ value: int [1:978] 96 97 88 90 86 82 80 79 77 76 ...
##   ..$ datasetInterval: int 1
##   ..$ datasetType    : chr "minute"

library(chron);

heartrate <- hr.content[['activities-heart-intraday']]$dataset;
heartrate$time <- chron(
  dates = rep(date, nrow(heartrate)), 
  times = heartrate$time,
  format = c('dates' = 'y-m-d', 'times' = 'h:m:s')
);