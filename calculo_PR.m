%Haciendo uno uso del algoritmo proporcionado en el enunciado, realizamos
%la función.
function [pagerank,ordenpagerank,precision,tiempo]=calculo_PR(A,alfa,niter)
 tic %Para calcular el tiempo del cálculo
 N = size(A,1); %Número de nodos
 e= ones(N,1); %Vector de unos 
 eT= ones(1,N);
 Nj = sum(A,1)'; %Cálculo de links de salida de cada nodo
 dj= (Nj== 0);
 v = alfa * dj' + (1-alfa) * eT ;
 x0= e/N; %Elegimos un vector normalizado
 %Hacer el método de la potencia
 for k = 1:niter 
      x1 = x0/sum(x0);
      Gx= alfa * (A* x1) + (1/N) * e * (v * x1);
      x0 = Gx;
 end
 x0= x0 / sum(x0);
 pagerank= x0;
 %He utilizado una función para ordenar los pangerank, es más eficiente
 %para matrices grandes
 [pagerank,ordenpagerank] = sort(pagerank,'descend');
 precision = norm(Gx- x0,2);
 tiempo = toc;
end
 
