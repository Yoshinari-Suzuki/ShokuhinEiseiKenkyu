data {
  int<lower=1> N;
  vector[N] Y_L;
  vector[N] Y_U;
  vector[2] gsd_int;
  int<lower=1> N_new;
}

parameters {
  real<lower=min(Y_L), upper=max(Y_U)> mean_est;
  real<lower=1> gsd;
}

transformed parameters {
  real gm; // 期待値と幾何標準偏差から変換する
  gm = mean_est / exp(0.5*log(gsd)^2);
}

model {
  // 事前分布
  target += uniform_lpdf(mean_est | min(Y_L), max(Y_U));
  target += cauchy_lpdf(gsd | gsd_int[1], gsd_int[2]) - cauchy_lccdf(1 | gsd_int[1], gsd_int[2]);
  // モデル
  for (i in 1:N) {
    if (Y_L[i] == Y_U[i]) {
      target += lognormal_lpdf(Y_U[i] | log(gm), log(gsd));
    } else {
      if (Y_L[i] == 0) {
        target += lognormal_lcdf(Y_U[i] | log(gm), log(gsd));
      } else {
        target += log( lognormal_cdf(Y_U[i], log(gm), log(gsd)) - lognormal_cdf(Y_L[i], log(gm), log(gsd)) );
      }
    }
  }
}

generated quantities {
  real sd_est;
  real log_lik[N];
  real Y_new[N_new];
  
  sd_est = mean_est * sqrt( exp( log(gsd)^2 ) - 1 );
  for (i in 1:N) {
    if ( Y_L[i]==Y_U[i] ) {
      log_lik[i] = lognormal_lpdf( Y_U[i] | log(gm), log(gsd) );
    } else {
      if ( Y_L[i]==0 ) {
        log_lik[i] = lognormal_lcdf( Y_U[i] | log(gm), log(gsd) );
      } else {
        log_lik[i] = log( lognormal_cdf( Y_U[i], log(gm), log(gsd) ) - lognormal_cdf( Y_L[i], log(gm), log(gsd) ) );
      }
    }
  }
  for (i in 1:N_new) Y_new[i] = lognormal_rng(log(gm), log(gsd));
}
