% Craciunoiu Cezar 314CA
% Pentru fiecare k se calculeaza raportul cerut si la final se afiseaza.
function cerinta54(image, int)
  A = double(imread(image));
  [m n] = size(A);
  cnt = 0;
  for k = int
    cnt++;
    y(cnt) = (2*k+1)/n;  
  endfor
  x = linspace(0, 100, length(y));  
  plot(x, y); 
  
  
endfunction