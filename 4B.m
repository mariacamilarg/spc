# Punto 4 - Parte B
warning('off','all');

# X = matriz(uso de procesador, consumo de ancho de banda) de un servidor internet
load("Xfile.mat");
[nrows,ncols] = size(X);
xaxis = 1:1:nrows;
plot(xaxis, X(:,1), xaxis, X(:,2)); #plot columns
legend("Uso procesador", "Ancho de banda");
#print("./Documents/GitHub/spc/4.jpg", "-djpg");


# Mean and Covariance Matrices
mu = zeros(ncols, 1);
mu = 1/nrows*sum(X,1)';
printf("Matriz de promedios: \n");
disp(mu);

sigma = cov(X,1);
printf("Matriz de covarianza: \n");
disp(sigma);

correl = corr(X);
printf("Matriz de correlacion: \n");
disp(correl);
printf("\n");


# Anomaly if p(x) < epsilon
epsilon = 8.990853*(10^(-5));

function res = probabilidad (vals, mu, sigma, ncols)
  p = (vals-mu)'*sigma^-1*(vals-mu)/-2;
  res = e^p/( (2*pi)^(ncols/2)*sqrt(det(sigma)) );
endfunction

# Muestra (19,10)
vals = [19, 10]';
printf("Muestra = (19,10)\n");
prob = probabilidad(vals,mu,sigma,ncols);
printf("Probabilidad (19,10) =");
disp(prob);
if (prob < epsilon)
  printf("La muestra (19,10) es anomala.\n\n");
else
  printf("La muestra (19,10) es normal.\n\n");
endif

# Muestra (17,12)
vals = [17,12]';
printf("Muestra = (17,12)\n");
prob = probabilidad(vals,mu,sigma,ncols);
printf("Probabilidad(17,12) =");
disp(prob);
if (prob < epsilon)
  printf("La muestra (17,12) es anomala.\n\n");
else
  printf("La muestra (17,12) es normal.\n\n");
endif
