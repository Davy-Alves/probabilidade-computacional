acertos90 = 0;
acertos95 = 0;
acertos99 = 0;

for i = 1:5000
    if 3 > intervalos90(i, 1) & 3 < intervalos90(i, 2)
        acertos90 = acertos90 + 1;
    end
    if 3 > intervalos95(i, 1) & 3 < intervalos95(i, 2)
        acertos95 = acertos95 + 1;
    end
    if 3 > intervalos99(i, 1) & 3 < intervalos99(i, 2)
        acertos99 = acertos99 + 1;
    end
end

porcentagem90 = acertos90/5000;
porcentagem95 = acertos95/5000;
porcentagem99 = acertos99/5000;

disp('Intervalo de 90%:', porcentagem90);
disp('Intervalo de 95%:', porcentagem95);
disp('Intervalo de 99%:', porcentagem99);


