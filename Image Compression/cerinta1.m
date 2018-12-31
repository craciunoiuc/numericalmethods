% Craciunoiu Cezar 314CA
% Se citeste matricea, se calculeaza descompunerea SVD, iar apoi se aleg
% liniile si coloanele necesare compresiei in functie de k
function A_k = cerinta1(image, k)
  A = double(imread(image));
  [S D V] = svd(A);
  A_k = S(:,1:k)*D(1:k, 1:k)*(V(:, 1:k))';
endfunction