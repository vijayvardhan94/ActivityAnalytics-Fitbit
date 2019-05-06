# generate lagged time series
merged.data$steps.lag1 <- c(NA, merged.data$steps[-nrow(merged.data)]);
merged.data$steps.lag2 <- c(NA, merged.data$steps.lag1[-nrow(merged.data)]);
merged.data$steps.lag3 <- c(NA, merged.data$steps.lag2[-nrow(merged.data)]);
merged.data$steps.lag4 <- c(NA, merged.data$steps.lag3[-nrow(merged.data)]);

full.lagged.model <- lm(
  heartrate ~ steps + steps.lag1 + steps.lag2 + steps.lag3 + steps.lag4,
  merged.data
);

print( summary(full.lagged.model)$coefficients );
lagged.model <- lm(
  heartrate ~ steps + steps.lag1 + steps.lag2 + steps.lag1:steps.lag2,
  merged.data
);

print( summary(lagged.model)$coefficients );

plot(
  heartrate ~ time,
  merged.data, 
  pch = 19,
  ylab = 'Heartrate',
  xlab = '',
  main = 'Two Minute Lagged Model with Interaction',
  cex = 0.7
);

points(
  lagged.model$fitted.values ~ merged.data$time[-c(1, 2)],
  col = 'firebrick',
  pch = 19,
  cex = 0.7,
  xlab = 'Steps per minute',
  ylab = 'Heartrate'
);

# add legend
legend(
  x = merged.data$time[3],
  y = 128,
  bty = 'n',
  legend = c('observed', 'expected'),
  pch = 19,
  col = c('black', 'firebrick'),
  cex = 0.7
);