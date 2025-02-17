clf()

// Gera o histograma das amostras transformadas
// Isso mostra a distribuição empírica das amostras obtidas a partir da FDA inversa
histplot(x, amostras_transformadas)

// Plota a função densidade de probabilidade (FDP) teórica no mesmo gráfico
// O gráfico representa a distribuição exata conforme definida na questão
// A linha vermelha ('r') e a largura de linha 2 tornam a curva mais visível
plot(x, fdp_teorica, 'r', 'LineWidth', 2);


