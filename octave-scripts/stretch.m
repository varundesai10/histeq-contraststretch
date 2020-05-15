%function to perform a bit better contrast stretching
function J = stretch(I)
  %setting p_low = 0.1%, p_high = 99.9%;
  p_low = 0.001; p_high = 0.99;
  [counts, x] = imhist(I);
  %printf('found counts');
  [prob, cumprob] = probablities(counts, size(I,1), size(I,2));
  %printf('found prob');
  J = zeros(size(I,1), size(I,2), 'uint8');
  MAX = max(max(I)); MIN = min(min(I));
  
  %now finding the actual intensities that correspond to this.
  i_low = 0;
  while(cumprob(i_low + 1) <= 0.0001)
    i_low = i_low + 1;
  endwhile
  
  i_high = 255;
  while(cumprob(i_high + 1) >= 0.9999)
    i_high = i_high - 1;
  endwhile
  
  %now mapping the functions!
  for i = 1:size(I,1)
    for j = 1:size(I,2)
      if(I(i,j) <= i_low)
        J(i,j) = 0;
      elseif (I(i,j) < i_high) %use the earlier mapping function
        J(i,j) = uint8(255*double((I(i,j) - MIN))/(MAX-MIN));
      else
         J(i,j) = 255;
      endif
   endfor
  endfor
endfunction  