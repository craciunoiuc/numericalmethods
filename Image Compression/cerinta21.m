% Craciunoiu Cezar 314CA
% Se reprezinta grafic elementele de pe diagonala matricei, punand pe OX
% length(y) puncte echidistante intre 0 si 100.
function cerinta21(A)
  [S D V] = svd(A);
  y = diag(D, 0)';
  %ys = sort(y, 'descend');
  x = linspace(0, 100, length(y));
  plot(x, y);
endfunction