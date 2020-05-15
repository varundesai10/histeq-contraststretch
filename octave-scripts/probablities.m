function [prob, cumprob] = probablities(counts,x,y)
  prob = double(counts/double(x*y));
  cumprob = zeros(256,1);
  curr_prob = 0;
  
  %calculating cumulative probablities
  for j = 1:256
    cumprob(j) = curr_prob + prob(j);
    curr_prob = cumprob(j);
  endfor
endfunction