% Craciunoiu Cezar 314CA
function [A_k, D] = cerinta3(image, k)
  % Se citeste imaginea in matrice
  A = double(imread(image));
  [m n] = size(A);
  
  % Se calculeaza miu suma de pe fiecare linie si se imparte la n. Se
  % actualizeaza matricea A. Fiecare valoare se salveaza in vectorul de miu
  % notat miuv.
  for i=1:m
    miu = sum(A(i, :))/n;
    A(i, :) -= miu;
    miuv(i, 1) = miu;
  endfor
  
  % Se construieste matricea si se descompune svd.
  Z = A'/sqrt(n-1);
  [S D V] = svd(Z);
  
  % Se aleg primele k coloane si se construieste matricea A_k.
  W = V(:, 1:k);
  A_k = W * (W' * A) + miuv;
endfunction