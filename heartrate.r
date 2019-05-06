merged.data <- merge(steps, heartrate, by = 'time');
names(merged.data) <- c('time', 'steps', 'heartrate');

plot(
  heartrate ~ steps,
  merged.data,
  pch = 19, 
  xlab = 'Steps per minute',
  ylab = 'Heartrate'
);

linear.model <- lm(heartrate ~ steps, merged.data);
abline(linear.model, lty = 2, lwd = 2, col = 'firebrick');