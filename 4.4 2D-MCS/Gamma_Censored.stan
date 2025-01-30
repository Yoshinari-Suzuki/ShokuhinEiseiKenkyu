data {
  int<lower=1> N;
  vector[N] Y_L;
  vector[N] Y_U;
  vector[2] shape_int;
  int<lower=1> N_new;
}

parameters {
  real<lower=min(Y_L), upper=max(Y_U)> mean_est;
  real<lower=0> shape;
}

transformed parameters {
  real rate; // 期待値と形状パラメーター (shape) から比率パラメーター (rate) に変換
  
  rate = shape / mean_est;
}

model {
  // 事前分布
  target += uniform_lpdf(mean_est | min(Y_L), max(Y_U));
  target += cauchy_lpdf(shape | shape_int[1], shape_int[2]) - cauchy_lccdf(0 | shape_int[1], shape_int[2]);
  
  // モデル
  for (i in 1:N) {
    if (Y_L[i] == Y_U[i]) {
      target += gamma_lpdf(Y_U[i] | shape, rate);
    } else {
      if (Y_L[i] == 0) {
        target += gamma_lcdf(Y_U[i] | shape, rate);
      } else {
        target += log(gamma_cdf(Y_U[i] | shape, rate) - gamma_cdf(Y_L[i] | shape, rate));
      }
    }
  }
}

generated quantities {
  real sd_est;
  array[N] real log_lik;
  array[N_new] real Y_new;
  
  sd_est = sqrt(shape) / rate;
  for (i in 1:N) {
    if ( Y_L[i] == Y_U[i] ) {
      log_lik[i] = gamma_lpdf(Y_U[i] | shape, rate);
    } else {
      if ( Y_L[i] == 0 ) {
        log_lik[i] = gamma_lcdf(Y_U[i] | shape, rate);
      } else {
        log_lik[i] = log(gamma_cdf(Y_U[i] | shape, rate) - gamma_cdf(Y_L[i] | shape, rate));
      }
    }
  }

  for (i in 1:N_new) Y_new[i] = gamma_rng(shape, rate);
}
