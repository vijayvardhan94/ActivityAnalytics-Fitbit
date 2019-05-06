steps.connection <- curl(
  url = paste0('https://api.fitbit.com/1/user/-/activities/steps/date/', date, '/1d.json'),
  handle = h
);

steps.content <- fromJSON( readLines(steps.connection, warn = FALSE) );

steps <- steps.content[['activities-steps-intraday']]$dataset;
steps$time <- chron(
  dates = rep(date, nrow(steps)), 
  times = steps$time,
  format = c('dates' = 'y-m-d', 'times' = 'h:m:s')
);

steps <- steps[ steps$time %in% heartrate$time, ];

par(
  mfrow = c(2, 1),
  mar = c(3, 4, 0, 0)
);

plot(
  heartrate, 
  pch = 19,
  ylab = 'Heartrate',
  xlab = ''
);

plot(
  steps, 
  pch = 19,
  ylab = 'Steps per minute',
  xlab = ''
);