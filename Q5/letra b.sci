// Calculando a média e o desvio padrão das colunas de A
media_amostras = mean(amostras, "c");
desvio_amostras = stdev(amostras, "c");

// Definindo o tamanho da amostra
n = 10;

// Z-scores para diferentes intervalos de confiança
t_90 = 1.833;
t_95 = 2.262;
t_99 = 3.250;

// Calculando os intervalos de confiança para cada linha
for i = 1:5000
    
    // Intervalos de 90%, 95% e 99%
    intervalos90(i, :) = [media_amostras(i, 1) - t_90 * desvio_amostras(i, 1) / sqrt(n), media_amostras(i, 1) + t_90 * desvio_amostras(i, 1) / sqrt(n)];
    intervalos95(i, :) = [media_amostras(i, 1) - t_95 * desvio_amostras(i, 1) / sqrt(n), media_amostras(i, 1) + t_95 * desvio_amostras(i, 1) / sqrt(n)];
    intervalos99(i, :) = [media_amostras(i, 1) - t_99 * desvio_amostras(i, 1) / sqrt(n), media_amostras(i, 1) + t_99 * desvio_amostras(i, 1) / sqrt(n)];
    
    // Imprimindo os intervalos de confiança para cada linha
    disp("Linha " + string(i));
    disp("Intervalo 90%: " + string(intervalos90(i, :)));
    disp("Intervalo 95%: " + string(intervalos95(i, :)));
    disp("Intervalo 99%: " + string(intervalos99(i, :))); 
end
