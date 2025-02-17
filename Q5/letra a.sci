// Definindo os parâmetros
media = 3;        // Média da distribuição normal
desvio_padrao = 2; // Desvio padrão da distribuição normal
n_observacoes = 10; // Número de observações por amostra
n_amostras = 5000;  // Número total de amostras

// Gerando as amostras
amostras = grand(n_amostras, n_observacoes, "nor", media, desvio_padrao);

// Calculando os valores de media_amostral
media_amostral = mean(amostras, 'c');

// Exibindo os resultados
disp("Os valores de media_amostral são:");
disp(media_amostral);

