//LIBGEN
clc;
clear;
tab=5*rand(20,5)+0.5; //Gerador randomico de 20 tabuleiros
tab=round(tab); //Arredondamento
n=size(tab);
//disp(tab);
x=1;
w=1;
i=1;
j=1;
aux1=1;
aux2=1;
fit=0;
cont=0;
cont1=0;
tab_torneio=zeros(10,6)
geracao=0;
while (geracao<=100)
    //****** Contador da Fitnes ******
    //Conta Atacks das Rainhas Linha e Diagonal
    for w=1:1:20
        for i=1:1:5
            for j=(aux2+1):1:5
                //            Condicional de analise da localização das rainhas, para contar as fitness
                if tab(aux1,aux2)==tab(aux1,j)|abs(aux2-j)==abs(tab(aux1,aux2)-tab(aux1,j)) then
                    fit=fit+1;
                    tab(aux1,6)=fit
                end
            end
            aux2=aux2+1;
        end
        fit=0;
        aux2=1;
        aux1=aux1+1;
    end
//    disp(tab)
    w=1;
    //Torneio Randomico, seleção da melhor fitness
    while w<=10
        cont=round(20*rand(1)+0.5);
        cont1=round(20*rand(1)+0.5);
        aux1=tab(cont,6);
        aux2=tab(cont1,6);
        if aux1>=aux2 then
            tab_torneio(w,:)=tab(cont1,:);
        else
            tab_torneio(w,:)=tab(cont,:);
        end
        w=w+1;
    end
    tab_cruzamento=zeros(10,6)
    vetor_arma1=zeros(1:3);
    vetor_arma2=zeros(1:2);
    tab2=zeros(20,5);
    //*****Cruzamento*****
    for i=1:1:10
        cont=round(10*rand(1)+0.5);
        cont1=round(10*rand(1)+0.5);
        vetor_arma1=tab_torneio(cont,1:3);
        vetor_arma2=tab_torneio(cont1,4:5);
        tab_cruzamento(i,1:3)=vetor_arma1;
        tab_cruzamento(i,4:5)=vetor_arma2;
        tab2=[tab_torneio;tab_cruzamento];
    end
//    disp(tab2);
    //*****Mutação*****
    for i=1:1:2
        cont=round(5*rand(1)+0.5);
        cont1=round(5*rand(1)+0.5);
        cont2=round(20*rand(1)+0.5)
        tab2(cont2,cont)=cont1;
    end
    tab=zeros(20,5);
    tab=tab2;
    j=1;
    aux1=1;
    aux2=1;
    //****** Contador da Fitnes ******
    //Conta Atacks das Rainhas Linha e Diagonal
    for w=1:1:20
        for i=1:1:5
            for j=(aux2+1):1:5
                //            Condicional de analise da localização das rainhas, para contar as fitness
                if tab(aux1,aux2)==tab(aux1,j)|abs(aux2-j)==abs(tab(aux1,aux2)-tab(aux1,j)) then
                    fit=fit+1;
                    tab(aux1,6)=fit
                end
            end
            aux2=aux2+1;
        end
        fit=0;
        aux2=1;
        aux1=aux1+1;
    end
    j=1;
    aux1=1;
    aux2=1;
    disp(tab);
    geracao=geracao+1;
end
printf("A população otimizada de 20 tabuleiros para o problema de n rainhas é:")
disp(tab);
