/*b) Gere uma amostra de 10000 observações da distribuição acima
usando o método-da fda inversa e a função grand do Scilab.*/

// 10000 amostras em distribuição uniforme
amostras = grand(1, 10000, "unf", 0, 1)

// Distribuição fornecida na questão
x = 0:0.2:2;
fdp_teorica = (1/8) + (3/8)*x

// Função da FDA inversa
deff('x = inv_fda(x)','x = (-1 + sqrt(1 +(48*x)))/3')

// Amostras geradas a partir da aplicação da FDA inversa sobre "amostras"
amostras_transformadas = inv_fda(amostras)

//------------------------------------------------------------------------------

/*c) Esboce em um mesmo gráfico a fdp teórica descrita acima e o
histograma obtido através da amostra gerada no item b. Eles são
semelhantes?*/

clf()

//Histograma da distribuição (FDA inversa)
histplot(x, amostras_transformadas)

//Gráfico da FDP  para 0 <= x <= 2
plot(x, fdp_teorica, 'r', 'LineWidth', 2);

//------------------------------------------------------------------------------

/*e) Calcule a média e variância amostral da amostra gerada no item b.*/

// Calcular a média amostral
media = mean(amostras_transformadas)
disp("Média amostral: " + string(media))

// Calcular a variância amostral
var = variance(amostras_transformadas)
disp("Variância amostral: " + string(var))
