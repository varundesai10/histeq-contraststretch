function eqImg = equalize2(I, counts)
  
  J = zeros(size(I,1), size(I,2), 'uint8'); %outuput_image
  [prob, cumprob] = probablities(counts, size(I,1), size(I, 2));
  
  for i = 1:size(I,1)
    for j = 1:size(I,2)
      J(i,j) = floor(cumprob(I(i,j) + 1)*255);
    endfor
  endfor
  
  eqImg = J;

endfunction