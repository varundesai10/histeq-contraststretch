function J = mybandpass(I)
  J = zeros(size(I,1), size(I,2),'uint8');
  for i = 1:size(I,1)
    for j = 1:size(I,2)
      if(j > 2)
      J(i,j) = I(i,j) - I(i,j-2);
    endif
  endfor
endfor
endfunction
