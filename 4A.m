# Punto 4 - Parte A
warning('off','all');

# X = matriz(uso de procesador, consumo de ancho de banda) de un servidor internet
load("Xfile.mat");
[nrows,ncols] = size(X);
xaxis = 1:1:nrows;
plot(xaxis, X(:,1), xaxis, X(:,2)); #plot columns
legend("Uso procesador", "Ancho de banda");
#print("./Documents/GitHub/spc/4.jpg", "-djpg");


# Mean and Standard Deviaton
mus = mean(X);
sigmas = std(X);
printf("mu1, mu2:");
disp(mus);
printf("sigma1, sigma2:");
disp(sigmas);
printf("\n");


# Anomaly if p(x) < epsilon
epsilon = 8.990853*(10^(-5));

function res = probabilidad (val, mu, sig)
  p = (-(val-mu)^2)/(2*(sig^2));
  res = e^p/( sqrt(2*pi)*sig );
endfunction

# Muestra (19,10)
vals = [19,10];
printf("Muestra = (19,10)\n");
p1 = probabilidad(vals(1), mus(1), sigmas(1));
p2 = probabilidad(vals(2), mus(2), sigmas(2));
prob = p1 * p2;
printf("Probabilidad (19,10) =");
disp(prob);
if (prob < epsilon)
  printf("La muestra (19,10) es anomala.\n\n");
else
  printf("La muestra (19,10) es normal.\n\n");
endif

# Muestra (17,12)
vals = [17,12];
printf("Muestra = (17,12)\n");
p1 = probabilidad(vals(1), mus(1), sigmas(1));
p2 = probabilidad(vals(2), mus(2), sigmas(2));
prob = p1 * p2;
printf("Probabilidad (17,12) =");
disp(prob);
if (prob < epsilon)
  printf("La muestra (17,12) es anomala.\n\n");
else
  printf("La muestra (17,12) es normal.\n\n");
endif
