% Craciunoiu Cezar 314CA
% Se realizeaza acelasi calcul, ca la cerinta23, pentru A_k ca rezultat al
% cerintei 3.
function cerinta53(image, int)
  A = double(imread(image));
  [m n] = size(A);
  cnt = 0;
  for k = int
    cnt++;
    A_k = cerinta3(image, k);
    suma = (A - A_k).^2;
    suma = sum(sum(suma));
    y(cnt) = suma/(m*n);
  endfor
  x = linspace(0, 100, length(y));  
  plot(x, y);
endfunction