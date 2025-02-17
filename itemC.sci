clc;
clear;
close;


/*Para gerar 10.000 amostras com n=50 observações cada, seguindo uma distribuição uniforme contínua no intervalo[0,u] com u=10:*/

num_amostras = 10000;
n = 50;
u = 10;
amostras = grand(num_amostras, n, "unf", 0, u);

//ITEM c
/*considerando os estimadores 𝜇1= (X1+...+Xn)/n e 𝜇2(max(Xi) + min(Xi))/2*/

u1 =  mean(amostras, 'c') ;

u2 = (max(amostras, 'c') + min(amostras, 'c'))/2
/* Histograma de u1*/

histplot(100, u1);
title('histograma de u1');

/* Histograma de u2*/
histplot(100, u2);
title('histograma de u2');

// Média do estimador u1
media_u1 = (mean(u1));

// Média do estimador u2
media_u2 = (mean(u2));

/* Histograma da média amostral de u1*/

histplot(100, media_u1);
title('histograma de media_u1');

/* Histograma da média amostral de u2*/
histplot(100, media_u2);
title('histograma de media_u2');
