// Gerando 10000 amostras de uma distribuição uniforme no intervalo [0,1]
amostras = grand(1, 10000, "unf", 0, 1)

// Criando um vetor de valores de x no intervalo [0,2] com passo de 0.2
x = 0:0.2:2;

// Calculando a função densidade de probabilidade (FDP) teórica fornecida na questão
fdp_teorica = (1/8) + (3/8)*x

// Definindo a função inversa da função de distribuição acumulada (FDA)
// Essa função permite transformar amostras de uma distribuição uniforme 
// em amostras que seguem a distribuição especificada na questão
deff('x = inv_fda(x)','x = (-1 + sqrt(1 +(48*x)))/3')

// Aplicando a função inversa da FDA nas amostras uniformes
// Isso gera amostras que seguem a distribuição dada na questão
amostras_transformadas = inv_fda(amostras)

