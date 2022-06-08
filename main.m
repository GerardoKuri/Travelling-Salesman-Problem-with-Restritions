clear all;
close all;
clc;
format long g;
%%
%Captura de parámetros iniciales 
M=1000;
delta=0.00000002;
chroNo=100;
genNo=18;
D=0;
deltaVar=inf;
deltaIt=20;
Max=5;
porMut=10;


       
C_Mat=xlsread('Restricciones_Ciudades_Europa.xlsx',1,'B3:S20');
for i=1:18
    for j=1:18
        C_Mat(i,j)
        if C_Mat(i,j)<10000
            C_Mat(i,j)=C_Mat(i,j);
        else
            C_Mat(i,j)=1000000000;
        end
    end
end
tic
%%
%Generación de población y evalución de población generada
for j=1:Max
P=pop_init_TSP(genNo,chroNo);
[best,mean,distance]=popEvalTSP(P,C_Mat);
[fit,P,Prob]=fitTSP(P,C_Mat);
cont=0;
%X(cont)=cont;
%Ymean(cont)=mean;
%Ybest(cont)=best;
%Ydist(cont)=distance;
D=0;
deltaVar=inf;
%%
%Generación y evalución de generaciones: criterio de término es iteraciones
%máximas = M y promedio de aptitud > epsilon 
while cont<M & D<deltaIt
    %Selección de parejas a cruzar
    P=selecTSP('Poli',P,C_Mat);
    %Cruza de población 
    P=Ox(P);
    %P=heuristic(P,C_Mat,porMut);
    P=scramble(P,porMut);
    %P=PMx(P);
    %Criterio elitista: Competencia genética
    [F,P,Prob]=compGenTSP(P,C_Mat);
    
    %P=heuristic(P,C_Mat,porMut);
    %Evaluación de nueva generación y captura del hijo medio y mejor
    %adaptado
    [best,mean,distance]=popEvalTSP(P,C_Mat);
    cont=cont+1;
    X(cont)=cont;
    Ymean(cont)=mean;
    Ybest(cont)=best;
    Ydist(cont)=distance;
    %%
    %Cálculo del diferencial entre cada  generación
    Delta=mean-deltaVar;
    if (Delta)<delta
        D=D+1;
    else
        D=0;
    end
    deltaVar=mean;
end
fAcum(j)=Ydist(cont);
toc
end
figure(2)
boxplot(fAcum);
title('distance');
%yline(mean(rmseM),'--r','prom');
%yline(min(rmseM),'--r','best');
%ylim([4 5.3]);
hold on;
ylabel('distance');
%xlabel('100 It, Tournament, PMx, 5% Heuristic Mut, Comp Gen');
% s=round(std(fAcum),2)
% min=min(fAcum)
% max=max(fAcum)
% med=median(fAcum)
% t=round(toc/20,2)
% d=[s,min,max,med,t]
%%
%Gráfica de Hijo Medio
% figure(1)
% subplot(1,2,1);
% plot(X,Ymean,'-b');
% hold on;
% plot(X,Ymean,'*k');
% title('Hijo Medio');
% ylabel('Aptitud');
% xlabel('Iteración #');
% hold on;
% %%
% %Gráfica de menor distancia
% subplot(1,2,2);
% plot(X,Ydist,'-b');
% hold on;
% plot(X,Ydist,'*k');
% title('Menor distancia');
% ylabel('Distancia');
% xlabel('Iteración #');
% hold on;














