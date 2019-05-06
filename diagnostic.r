plot(
  heartrate, 
  pch = 19,
  ylab = 'Heartrate',
  xlab = '',
  main = 'Simple Linear Model',
  cex = 0.7
);

points(
  linear.model$fitted.values ~ heartrate$time,
  col = 'firebrick',
  pch = 19,
  cex = 0.7,
  xlab = 'Steps per minute',
  ylab = 'Heartrate'
);

# add legend
legend(
  x = heartrate$time[1],
  y = 128,
  bty = 'n',
  legend = c('observed', 'expected'),
  pch = 19,
  col = c('black', 'firebrick'),
  cex = 0.7
);