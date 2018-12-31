% Craciunoiu Cezar 314CA

function R = Algebraic(nume, d)
  
  % Pentru construirea matricei se urmeaza aceeasi pasi ca in iterative:
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
        Adiacenta(i-1, buffer(i, j)) = 1/LinkuriExterne;
      endif
    endfor
  endfor
  
  % Se initializeaza vectorul de page rank-uri cu 1/(numarul total de site-uri)
  R(1:NrSite) = 1/NrSite;
  R = R';
  Adiacenta = Adiacenta';
  
  % Se utilizeaza formula data pentru a calcula vectorul de page rank-uri
  % utilizandu-se o functie de inversare.
  R = GramSchmidt(eye(NrSite) - d*Adiacenta) * (((1 - d) / NrSite) * VectorUnu);
endfunction