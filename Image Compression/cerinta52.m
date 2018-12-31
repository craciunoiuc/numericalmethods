% Craciunoiu Cezar 314CA
% Se calculeaza raportul pentru fiecare element din interval si se afiseaza.
function cerinta52(image, int)
  A = double(imread(image));
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