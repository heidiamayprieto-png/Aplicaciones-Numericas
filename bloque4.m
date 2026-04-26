load mi_matriz_conectividad.mat

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
%bar(pagerank);
% maxPR = max(pagerank);
% nodosMaxPR = find(pagerank == maxPR);
% fprintf('\nNodos con mayor PageRank (%.4f): ', maxPR);
% fprintf('%d ', ordenpagerank(nodosMaxPR));
% fprintf('\nTotal de nodos con mayor PageRank: %d\n', length(nodosMaxPR));
% minPR = min(pagerank);
% nodosMinPR = find(pagerank == minPR);
% 
% % Abrir archivo de texto
% fid = fopen('nodos_menor_pagerank.txt','w');
% 
% fprintf(fid, 'Nodos con menor PageRank\n');
% fprintf(fid, 'PageRank mínimo: %.6f\n\n', minPR);
% 
% for i = 1:length(nodosMinPR)
%     fprintf(fid, 'Nodo %d   PageRank %.6f\n', ordenpagerank(nodosMinPR(i)), minPR);
% end
% 
% fprintf(fid, '\nTotal de nodos con menor PageRank: %d\n', length(nodosMinPR));
% 
% fclose(fid);
minPR = min(pagerank);
nodosMinPR = find(pagerank == minPR);
% fprintf('\nNodos con mayor PageRank (%.6f): ', maxPR);
% fprintf('%d ', ordenpagerank(nodosMaxPR));
% fprintf('\nTotal de nodos con mayor PageRank: %d\n', length(nodosMaxPR));

% Abrir archivo de texto
fid = fopen('nodos_menor_pagerankBloq3.txt','w');

fprintf(fid, 'Nodos con menor PageRank\n');
fprintf(fid, 'PageRank mínimo: %.8f\n\n', minPR);

for i = 1:length(nodosMinPR)
    fprintf(fid, 'Nodo %d   PageRank %.8f\n', ordenpagerank(nodosMinPR(i)), minPR);
end

fprintf(fid, '\nTotal de nodos con menor PageRank: %d\n', length(nodosMinPR));

fclose(fid);
