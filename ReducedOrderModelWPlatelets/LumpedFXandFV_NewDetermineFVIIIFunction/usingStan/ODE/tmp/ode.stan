functions {
	       real[] sho(real t,
		          real[] y,
		          real[] theta,
		          real[] x_r,
		          int[] x_i) {
		 real dydt[2];
		 dydt[1] <- y[2];
		if(t>4){
			dydt[1] <-5*y[2];		
		}
		 dydt[2] <- -y[1] - theta[1] * y[2];
		 return dydt;
		}
	}

	data {
	  int<lower=1> T;
	  int<lower=1> M;
	  real t0;
	  #real y0[M];
	  real ts[T];
	  real y[T,M];
	}

	transformed data {
	  real x_r[0];
	  int x_i[0];
	}

	parameters {
	  real y0[2];
	  vector<lower=0>[2] sigma;
	  real theta[1];
	}

	model {
	  real y_hat[T,2];
	  sigma ~ cauchy(0,2.5);
	  theta ~ normal(0,1);
	  y0 ~ normal(0,1);
	  y_hat <- integrate_ode(sho, y0, t0, ts, theta, x_r, x_i);
	  for (t in 1:T)
	   y[t] ~ normal(y_hat[t], sigma);
	}

	generated quantities{
		real y_hat[T,2];
		y_hat = integrate_ode_rk45(sho, y0, t0, ts, theta, x_r, x_i);
		// add measurement error
		for (t in 1:T) {
		y_hat[t, 1] = y_hat[t, 1] + normal_rng(0, 0.1);
		y_hat[t, 2] = y_hat[t, 2] + normal_rng(0, 0.1);
		}
	}