// Número total derepetições da situação.
n = 50000;

// Probabilidade de funcionamento de cada componente
p = 0.9;

// Vetor coluna para armazenar a frequência de sucessos
resultados = zeros(n,1);

// Contadores de Sucesso e Falha
sucesso = 0;
falha = 0;

//Contadores de Rota
caminho_C1_C2 = 0;
caminho_C1_C3 = 0;
caminho_C1_C4 = 0;

//Contadores de Rota Individual
caminho_C1_C2t = 0;
caminho_C1_C3t = 0;
caminho_C1_C4t = 0;


// Loop de simulação
for i = 1:n

    // Gerar estados aleatórios para os 4 componentes
    C1 = rand() < p;
    C2 = rand() < p;
    C3 = rand() < p;
    C4 = rand() < p;
    
    // O sistema funcionará se C1 funcionar e pelo menos um de C2, C3 ou C4 funcionar
    if (C1 && (C2 || C3 || C4)) then
        sucesso = sucesso + 1;
        
        // Identificar qual caminho gerou o sucesso
        if C2 then caminho_C1_C2 = caminho_C1_C2 + 1; end
        if C3 then caminho_C1_C3 = caminho_C1_C3 + 1; end
        if C4 then caminho_C1_C4 = caminho_C1_C4 + 1; end
        
        // Contabilizar apenas um caminho por vez (prioridade: C1-C2 > C1-C3 > C1-C4)
        if C2 then 
            caminho_C1_C2t = caminho_C1_C2t + 1; 
        elseif C3 then 
            caminho_C1_C3t = caminho_C1_C3t + 1; 
        else 
            caminho_C1_C4t = caminho_C1_C4t + 1; 
        end
        
    else
        falha = falha + 1;
    end
    
    // Guardar a estimativa da probabilidade
    resultados(i) = sucesso / i;
    
    // Mostrar valores intermediários a cada 10.000 iterações
    if (modulo(i, 10000) == 0) then
        disp("Após " + string(i) + " simulações, a probabilidade estimada é: " + string(resultados(i)));
    end
end

// Exibir resultado final
disp("==============================");
disp("Resultados finais da simulação:");
disp("Total de simulações: " + string(n));
disp("Sucessos (sistema funcionando): " + string(sucesso) + " (" + string((sucesso/n)*100) + "%)");
disp("Falhas (sistema não funcionando): " + string(falha) + " (" + string((falha/n)*100) + "%)");

disp("==============================");
disp("==============================");
disp("==============================");

//Frequencia relativa de cada rota
freq_C1_C2 = caminho_C1_C2 / n;
freq_C1_C3 = caminho_C1_C3 / n;
freq_C1_C4 = caminho_C1_C4 / n;
freq_Falha = falha/n;

// Criando a tabela de frequência relativa
disp("Tabela de Frequência Relativa:");
disp("Rotas Paralelas");
disp("------------------------------------------------");
disp("| Caminho    | Ocorrências | Frequência Relativa|");
disp("------------------------------------------------");
disp(msprintf("| C1 → C2    | %8d    | %.4f ou %.2f%%  |", caminho_C1_C2,freq_C1_C2, freq_C1_C2*100));
disp(msprintf("| C1 → C3    | %8d    | %.4f ou %.2f%%  |", caminho_C1_C3, freq_C1_C3,freq_C1_C3*100));
disp(msprintf("| C1 → C4    | %8d    | %.4f ou %.2f%%  |", caminho_C1_C4, freq_C1_C4,freq_C1_C4*100));
disp(msprintf("| X  → X     | %8d    | %.4f ou %.2f%%  |", falha, freq_Falha,freq_Falha*100));
disp("------------------------------------------------");

//Frequencia relativa de cada rota
freq_C1_C2t = caminho_C1_C2t / n;
freq_C1_C3t = caminho_C1_C3t / n;
freq_C1_C4t = caminho_C1_C4t / n;
freq_Falha = falha/n;


disp("==============================");
disp("==============================");
disp("==============================");
// Criando a tabela de frequência relativa
disp("Tabela de Frequência Relativa:");
disp("Rotas Individuais");
disp("------------------------------------------------");
disp("| Caminho    | Ocorrências | Frequência Relativa|");
disp("------------------------------------------------");
disp(msprintf("| C1 → C2    | %8d    | %.4f ou %.2f%%  |", caminho_C1_C2t,freq_C1_C2t, freq_C1_C2t*100));
disp(msprintf("| C1 → C3    | %8d    | %.4f ou %.2f%%   |", caminho_C1_C3t, freq_C1_C3t,freq_C1_C3t*100));
disp(msprintf("| C1 → C4    | %8d    | %.4f ou %.2f%%   |", caminho_C1_C4t, freq_C1_C4t,freq_C1_C4t*100));
disp(msprintf("| X  → X     | %8d    | %.4f ou %.2f%%  |", falha, freq_Falha,freq_Falha*100));
disp("------------------------------------------------");
// Mostrando também a soma das ocorrências e frequência total (deve ser ≈ 1)
disp(msprintf("| TOTAL      | %8d     | %.4f           |", sucesso+falha, (freq_C1_C2t + freq_C1_C3t + freq_C1_C4t +freq_Falha)));
disp("------------------------------------------------");


// Criar histograma
//clf;
//histplot(20, resultados);
//xlabel("Probabilidade estimada");
//ylabel("Frequência");
//title("Distribuição das Estimativas de Probabilidade");
//xgrid();

// Criar gráfico de barras para sucesso e falha
//subplot(1,2,2);
//bar([sucesso, falha], "r");
//xticks([1 2], ["Sucesso" "Falha"]);
//ylabel("Número de ocorrências");
//title("Frequência de Sucesso e Falha");
//xgrid();

// Resultado das Rotas
//disp("==============================");
//disp("Distribuição dos caminhos que geraram sucesso:");
//disp("Caminho C1 e C2: " + string(caminho_C1_C2) + " (" + string((caminho_C1_C2/sucesso)*100) + "%)");
//disp("Caminho C1 e C3: " + string(caminho_C1_C3) + " (" + string((caminho_C1_C3/sucesso)*100) + "%)");
//disp("Caminho C1 e C4: " + string(caminho_C1_C4) + " (" + string((caminho_C1_C4/sucesso)*100) + "%)");

//Resultado das Rotas Individuais
//disp("==============================");
//disp("Distribuição dos caminhos que geraram sucesso Individualmente:");
//disp("Caminho C1 e C2: " + string(caminho_C1_C2t) + " (" + string((caminho_C1_C2t/sucesso)*100) + "%)");
//disp("Caminho C1 e C3: " + string(caminho_C1_C3t) + " (" + string((caminho_C1_C3t/sucesso)*100) + "%)");
//disp("Caminho C1 e C4: " + string(caminho_C1_C4t) + " (" + string((caminho_C1_C4t/sucesso)*100) + "%)");
//disp("==============================");
