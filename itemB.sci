clc;
clear;
close;


// Para gerar 10.000 amostras com n=50 observações cada, seguindo uma distribuição uniforme contínua no intervalo [0, u] com u=10:
num_amostras = 10000;
n = 50;
u = 10;
amostras = grand(num_amostras, n, "unf", 0, u);

// ITEM B
// Considerando os estimadores u1 = max(X1,...,Xn) e u2 = ((n+1)/n)*max(X1,...,Xn)
u1 = max(amostras, 'c');
u2 = ((n+1)/n) * u1;

// Histograma de u1
figure;
histplot(100, u1);
title('Histograma de u1');

// Histograma de u2
figure;
histplot(100, u2);
title('Histograma de u2');

// Média do estimador u1
media_u1 = mean(u1);

// Média do estimador u2
media_u2 = mean(u2);


// Histograma da média amostral de u1
figure;
histplot(100, media_u1);
title('Histograma de u1 com média');

// Histograma da média amostral de u2
figure;
histplot(100, media_u2);
title('Histograma de u2 com média');
