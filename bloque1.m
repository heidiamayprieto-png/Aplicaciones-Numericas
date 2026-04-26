% Código principal simple CORREGIDO
load web-Stanford.mat;

C = Problem.A;
C = sparse(C);

Nj = sum(C,1);
Nj(Nj==0) = 1;   % evitar división por cero
niter= 100;
A = C * spdiags(1./Nj', 0, size(C,2), size(C,2));
[pagerank, ordenpagerank, precision, tiempo] = calculo_PR(A,0.85,niter);
vars = whos;
memoria_bytes = sum([vars.bytes]);
memoria_MB = memoria_bytes / (1024^2);
% fprintf('\n=== STANFORD WEB MATRIX ===\n');
% fprintf('Tiempo [seg]: %.2f\n', tiempo);
% fprintf('Memoria [MB]: %.2f\n', memoria_MB);
% fprintf('Iteraciones: %d\n', niter);
% fprintf('Precisión: %.2e\n', precision);
% 

%bar(pagerank);
% 2. Top 20 mayores

% maxPR = max(pagerank);
% nodosMaxPR = find(pagerank == maxPR);
% fprintf('\nNodos con mayor PageRank (%.4f): ', maxPR);
% fprintf('%d ', ordenpagerank(nodosMaxPR));
% fprintf('\nTotal de nodos con mayor PageRank: %d\n', length(nodosMaxPR));
for i = length(pagerank) - 19:length(pagerank)
  fprintf('Orden %2d  Nodo %8d  Pagerank %.8f\n', i, ordenpagerank(i), pagerank(i));
end
