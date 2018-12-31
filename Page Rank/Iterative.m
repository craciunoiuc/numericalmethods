% Craciunoiu Cezar 314CA

function R = Iterative(nume, d, eps)
  
  % Se deschide fisierul si se citeste fisierul ca o matrice, si, cunoscandu-se
  % restrictiile fisierului de intrare se citesc restul elementelor.
  file = fopen(nume, "r");
  buffer = dlmread(file);
  fclose(file);
  NrSite = buffer(1, 1);
  VectorUnu = ones(NrSite, 1);
  
  % Se citeste lista de vecini si se scad linkurile care sunt catre site-ul
  % de pe care provin, adica cele de pe diagonala principala a matricei.
  for i = 2:(NrSite + 1)
    NrLinkuri = buffer(i, 2);
    LinkuriExterne = NrLinkuri;
    for j = 3:(2 + NrLinkuri)
      if buffer(i, j) == buffer(i, 1)
          LinkuriExterne--;
          break;
      endif
    endfor
    
    % Se construieste matricea de adiacenta cu logica fuzzy.
    for j = 3:(2 + NrLinkuri)
      if buffer(i, j) != buffer(i, 1)
        Adiacenta(i - 1, buffer(i, j)) = 1/LinkuriExterne;
      endif
    endfor
  endfor
  
  % Se initializeaza vectorul de page rank-uri cu 1/(numarul total de site-uri)
  R(1:NrSite) = 1/NrSite;
  R = R';
  Adiacenta = Adiacenta';
  
  % Se da o valoare pentru RAnt adica pentru R la pasul t pentru a indeplini
  % conditia while-ului macar o data.
  RAnt = R + 1;
  while norm(R - RAnt) > eps
    RAnt = R; 
    R = d * Adiacenta * R + ((1 - d) / NrSite)*VectorUnu;
  endwhile
  
  % La final se pastreaza pasul t.
  R = RAnt;
endfunction