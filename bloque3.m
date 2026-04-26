data = readmatrix('web-Google.txt','FileType','text');

i = 1 + data(:,1);
j = 1 + data(:,2);
v = 1;

N = max(max(data)) + 1;
C = sparse(i, j, v, N, N);
Nj = sum(C,1);            % links de salida
A = C * spdiags(1./max(Nj,1), 0, size(C,2), size(C,2));
Num= size(A);
[n,m]= size(A)
% t = issparse(A)
% whos("A")
% nnz(A)
%B= A -1 
num_unos= nnz(C==1);
num_total = m * n; 
 num_ceros = num_total - nnz(C);
num_distintos = nnz(C) - num_unos;
H = C(1:1000,1: 1000)
% nnz(H)
% links_salida = sum(C);
% media_links = mean(links_salida);
% [max_links,nodo_max] = max(links_salida);
% nnz(C);
% num_unos = nnz(C==1)

% [max_links,nodo_max] = max(links_salida)
indice= nnz(A)/num_total;

% % nodos_sin_salida = sum(Nj == 0)
% % links_salida = sum(A);
% % media_links= mean(links_salida);
% nodos_sin_salida = sum(links_salida == 0)
% nodos_con_salida = sum(links_salida > 0)
% % totla = nodos_con_salida + nodos_sin_salida
 niter = 100;
[pagerank, ordenpagerank, precision, tiempo] = calculo_PR(A,0.85,niter);
prec = precision;
% % prc= precision;
% % vars = whos;
% % memoria_bytes = sum([vars.bytes]);
% % memoria_MB = memoria_bytes / (1024^2);
% % fprintf('\n=== STANFORD WEB MATRIX ===\n');
% % fprintf('Tiempo [seg]: %.2f\n', tiempo);
% % fprintf('Memoria [MB]: %.2f\n', memoria_MB);
% % fprintf('Iteraciones: %d\n', niter);
% % fprintf('Precisión: %.2e\n', precision);
% % bar(pagerank);
% % minPR = min(pagerank);
% % nodosMinPR = find(pagerank == minPR);
% % % fprintf('\nNodos con mayor PageRank (%.6f): ', maxPR);
% % % fprintf('%d ', ordenpagerank(nodosMaxPR));
% % % fprintf('\nTotal de nodos con mayor PageRank: %d\n', length(nodosMaxPR));
% % 
% % % Abrir archivo de texto
% % fid = fopen('nodos_menor_pagerankBloq3.txt','w');
% % 
% % fprintf(fid, 'Nodos con menor PageRank\n');
% % fprintf(fid, 'PageRank mínimo: %.6f\n\n', minPR);
% % 
% % for i = 1:length(nodosMinPR)
% %     fprintf(fid, 'Nodo %d   PageRank %.8f\n', ordenpagerank(nodosMinPR(i)), minPR);
% % end
% % 
% % fprintf(fid, '\nTotal de nodos con menor PageRank: %d\n', length(nodosMinPR));
% % 
% % fclose(fid);



