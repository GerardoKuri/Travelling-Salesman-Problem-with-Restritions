%Funci�n que recibe un arreglo de probabilidades ordenadas 
%Devuelve la posici�n de la probabilidad ganadora en la ruleta
function nextChrom = rouletteWheel(Prob)
cumSumP=cumsum(Prob);
r=rand();
nextChrom=find(r <= cumSumP,1);
end