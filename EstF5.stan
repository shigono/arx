data {
  int<lower=0> T;
  vector[T] y;
  vector[T] x;
}
parameters {
  real beta;
  real rho; 
  real<lower=0> sigma;
}
model {
  vector[T] v; 
  v = y - beta * x; 
  // v[1] ~ normal(0, sigma/sqrt(1-rho^2));
  v[2:T] ~ normal(rho * v[1:(T-1)], sigma);
}
