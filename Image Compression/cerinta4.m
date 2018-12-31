% Craciunoiu Cezar 314CA
function [A_k, S] = cerinta4(image, k)
  % Se citeste matricea.
  A = double(imread(image));
  [m n] = size(A);
  
  % Ca la cerinta3 se calculeaza miu, se actualizeaza matricea si se salveaza
  % valoarea lui miu.
  for i=1:m
    miu = sum(A(i, :))/n;
    A(i, :) -= miu;
    miuv(i, 1) = miu;
  endfor
  
  % Se construieste matricea de covarianta si se calculeaza vectorul si
  % valorile proprii ale acesteia.
  Z = A * (A' / (n-1));
  [V S] = eig(Z);
  
  % Se aleg primele k coloane si se construieste A_k.
  W = V(:, 1:k);
  A_k = W * (W' * A) + miuv;
endfunction