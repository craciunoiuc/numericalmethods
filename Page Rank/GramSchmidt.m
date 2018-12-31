% Craciunoiu Cezar 314CA

function B = GramSchmidt(A)
  
  % Se utilizeaza o varianta modificata a algoritmului GramSchmidt pentru a
  % pastra stabilitatea valorilor. Se incearca utilizarea vectorizarilor in
  % locul buclelor for.
	r = zeros(size(A));
	q = A;
  marime = size(A)(2);
	for i = 1:marime
	  r(i, i) = norm(q(:, i));
		q(:, i) = q(:, i) / r(i, i);
		r(i, (i+1):marime) = q(:, i)' * q(:, (i+1):marime);
		q(:, (i+1):marime) -= q(:, i) * q(:, i)' * q(:, (i+1):marime);
	endfor
  
  % Se rezolva ecuatiei de forma R * A^(-1) = Q' utilizandu-se algoritmul
  % pentru sistemele de forma Ax=b superior triunghiulare adaptat pentru
  % matrice patratice. Se utilizeaza functia fliplr pentru a parcurge matricea
  % invers.
  q = q';
  marime = size(r)(1);
  B = zeros(marime);
  reverse = fliplr(1:marime);
  for i = reverse
    for j = reverse
      sum = 0;
      sum += r(i, (i+1):marime) * B((i+1):marime, j);
      B(i, j) = (q(i, j) - sum) / r(i, i);
    endfor
  endfor
endfunction