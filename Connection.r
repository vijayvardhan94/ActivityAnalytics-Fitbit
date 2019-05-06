#opening connection to the api endpoint
library(curl);

# Read Fitbit token from file
token <- scan('~/fitbit_token.txt', what = character() );

h <- new_handle();

handle_setheaders(
  h,
  'Authorization' = paste('Bearer', token)
);
