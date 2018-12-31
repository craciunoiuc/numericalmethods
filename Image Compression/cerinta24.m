% Craciunoiu Cezar 314CA
% Pentru fiecare element din interval se calculeaza raportul cerut si se
% reprezinta graficul la final.
function cerinta24(A, int)
  [m n] = size(A);
  cnt = 0;
  for k = int
    cnt++;
    y(cnt) = (m*k +n*k + k)/(m*n);  
  endfor
  x = linspace(0, 100, length(y));  
  plot(x, y);
endfunction