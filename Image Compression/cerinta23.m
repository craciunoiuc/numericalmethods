% Craciunoiu Cezar 314CA
% Se calculeaza A_k folosind prima cerinta, se realizeaza diferenta de matrici
% si se ridica fiecare element la patrat. Apoi se aduna toate elementele din
% matrice si se calculeaza raportul suma1/(m*n).
function cerinta23(A, image, int)
  [m n] = size(A);
  cnt = 0;
  for k = int
    cnt++;
    A_k = cerinta1(image, k);
    suma = (A - A_k).^2;
    suma = sum(sum(suma));
    y(cnt) = suma/(m*n);
  endfor
  x = linspace(0, 100, length(y));  
  plot(x, y);
endfunction