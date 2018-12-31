% Craciunoiu Cezar 314CA
% Se reprezinta vectorul S cu length(y) puncte egal departate de la 0 la 100.
function cerinta51(image)
  [A_k, y] = cerinta3(image, 1);
  y = diag(y, 0)';
  x = linspace(0, 100, length(y));
  plot(x, y);
endfunction