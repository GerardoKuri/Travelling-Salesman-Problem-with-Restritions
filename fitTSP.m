%Funci�n que recibe una poblaci�n de n cromosomas con una permutaci�n de 18 genes
%y matriz descriptiva de las distancias.
%Devuelve la poblaci�n ordenada por aptitud, arreglo de aptitudes
%ordenadas y arreglo de probabilidades de cada cromosoma seg�n aptitud (este
%�ltimo arreglo solo se utiliza para la selecci�n de ruleta.
function [fit,P,Prob]=fitTSP(P,C_Mat)
% for i = 1:11
%     P.chromosome(i).gene=zeros(50);
% end
% P.chromosome
C_len=size(C_Mat,1);
len=size(P.chromosome(:),1);
for i=1:len
    P.chromosome(i).distance=0;
    for j=1:C_len-1
        ciudadAct=P.chromosome(i).gene(j);
        ciudadNext=P.chromosome(i).gene(j+1);
        P.chromosome(i).distance=C_Mat(ciudadAct,ciudadNext)+P.chromosome(i).distance;
    end
    P.chromosome(i).distance=C_Mat(P.chromosome(i).gene(18),P.chromosome(i).gene(1))+P.chromosome(i).distance;
end
for i=1:len
    P.chromosome(i).fitness=1/P.chromosome(i).distance;
end
[k,I]=sort([P.chromosome(:).distance]);
P.chromosome(:)=P.chromosome(I);
Max=max([P.chromosome(:).fitness]);
Min=min([P.chromosome(:).fitness]);
delta=Max-Min;
Prob=[];
fit=[];
for i=1:len
   %fit(i)=(P.chromosome(i).fitness-Min)/delta;
   fit(i)=P.chromosome(i).fitness;
end

for i=1:len
   Prob(i)=fit(i)./sum(fit);
end
end