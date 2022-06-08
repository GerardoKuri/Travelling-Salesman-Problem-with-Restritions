%Esta funci�n recibe la poblaci�n entera, la matriz de costos 
%y el porcentaje que se desea mutar en la poblaci�n
%La funci�n toma el porcentaje menos apto de la poblaci�n y lo muta
%con respecto al m�todo heur�stico.
%La funci�n regresa la poblaci�n con el porcentaje mutado
function P=heuristic(P,C_Mat,por)
[fit,P,Prob]=fitTSP(P,C_Mat);
Plen=size(P.chromosome(:),1);
Clen=size(P.chromosome(1).gene(:),1);
xPoint=randi([1,round(Clen/2)]);
xPoint2=xPoint+round(Clen/3);
Mlen=round(Plen*(por/100));
Perm=perms([1 2 3 4 5 6]);
for i = 1:Mlen
    string=P.chromosome(Plen-i+1).gene(xPoint+1:xPoint2);
    best=0;
    for j=1:720
        fit=fitTSPMut(string(Perm(j,:)),C_Mat);
        if fit>best
            bestStr=string(Perm(j,:));
            best=fit;
        end
    end
    %bestStr;
    P.chromosome(Plen-i+1).gene(xPoint+1:xPoint2)=bestStr;
end
end