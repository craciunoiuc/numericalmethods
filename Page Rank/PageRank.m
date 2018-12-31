% Craciunoiu Cezar 314CA

function [R1 R2] = PageRank(nume, d, eps)
  
  % Pentru graful dat se calculeaza Page Rank-ul prin cele doua metode
  % apelandu-se functiile create.
  R1 = Iterative(nume, d, eps);
  R2 = Algebraic(nume, d);
  
  % Se mai citeste o data matricea pentru a se putea extrage ultimele 2 valori.
  file = fopen(nume, "r");
  buffer = dlmread(file);
  val1 = buffer(size(buffer)(1) - 1, 1);
  val2 = buffer(size(buffer)(1), 1);
  fclose(file);
  
  % Se sorteaza vectorul de valori proprii descrescator si apoi se calculeaza
  % valoarea indicilor de apartenenta.
  NrSite = size(R1)(1);
  [sorted, index] = sort(R2');
  index = fliplr(index)';
  y = Apartenenta(fliplr(sorted)', val1, val2);
  
  % Se creeaza fisierul de iesire si se afiseaza folosind fprintf valorile in
  % ordinea dorita cu precizia ceruta de 6 zecimale.
  nume = [nume, '.out'];
  file = fopen(nume, "w");
  fprintf(file, "%d\n", NrSite);
  for i = 1:NrSite
    fprintf(file, "%.6f\n", R1(i));
  endfor
  fprintf(file, "\n");
  for i = 1:NrSite
    fprintf(file, "%.6f\n", R2(i));
  endfor
  fprintf(file, "\n");
  for i = 1:NrSite
    fprintf(file, "%d %d %.6f\n", i, index(i), y(i));
  endfor
  fclose(file);
endfunction