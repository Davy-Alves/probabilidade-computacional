clc;
clear;
close;

/*Para gerar 10.000 amostras com n=50 observações cada, seguindo uma distribuição uniforme contínua no intervalo[0,u] com u=10:*/

num_amostras = 10000;
n = 50;
u = 10;
amostras = grand(num_amostras, n, "unf", 0, u);


