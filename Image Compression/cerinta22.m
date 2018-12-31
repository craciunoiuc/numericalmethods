% Craciunoiu Cezar 314CA
% Se calculeaza raportul pentru fiecare k din intervalul dat si se reprezinta
% valorile obtinute.
function cerinta22(A, int)
  [S D V] = svd(A);
  [m n] = size(A);
  d = diag(D, 0)';
  cnt = 0;
  for k = int
    cnt++;
    y(cnt) = sum(d(1:k))/sum(d(1:min(m, n)));
  endfor
    x = linspace(0, 100, length(y));
    plot(x, y);
endfunction