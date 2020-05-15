function eqImg = equalize(I, counts)
  J = zeros(size(I,1), size(I,2), 'uint8');
  s = double(sum(counts));
  for i = 1:size(I, 1)
    for j = 1:size(I,2)
      x = I(i,j);
      y = double(sum(counts(1:x+1)))/s;
      J(i,j) = (floor(y*255));
    endfor
  endfor
  eqImg = J;
endfunction
