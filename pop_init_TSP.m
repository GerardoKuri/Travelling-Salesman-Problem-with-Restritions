%Funci�n que recibe dos n�meros pNo y cNo que corresponden al n�mero de
%cromosomas y n�mero de genes en el cromosoma sucesivamente.
%Devuelve la poblaci�n de cromosomas que consiste en permutaciones de 1 a cNo.
function [poblacion]=pop_init_TSP(cNo,pNo)
poblacion.len=pNo;
%leny=size(y,1);
for i = 1:pNo
    p=randperm(cNo);
    poblacion.chromosome(i).gene(:)=p;
end
end