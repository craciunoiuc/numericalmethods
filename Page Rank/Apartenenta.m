% Craciunoiu Cezar 314CA

function y = Apartenenta(x, val1, val2)
  
  % Se folosesc limite laterale pentru a se afla valorile lui b si a in functie
  % de valorile de intrare.
  b = val1 / (val1 - val2);
  a = 1 / (val2 - val1);
  y = zeros(size(x)(1), 1);
  
  % Se completeaza fiecare valoare tinandu-se cont de restrictiile impuse.
  for i = 1 : size(x)(1)
    if x(i) < val1
      y(i) = 0;
      continue;
    endif
    if x(i) > val2
      y(i) = 1;
      continue;
    endif
    y(i) = a * x(i) + b;
  endfor
endfunction
	