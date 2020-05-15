%function to perform contrast stretching, using a simple algorithm (works onyly on bw image)!
function J = stretch_simple(I)
  J = zeros(size(I,1), size(I,2), 'uint8');
  MAX = max(max(I));
  MIN = min(min(I));
  for i = 1:size(I,1)
    for j = 1:size(I,2)
      J(i,j) = uint8(round(255*double((I(i,j) - MIN))/(MAX-MIN)));
    endfor
  endfor
endfunction
      
