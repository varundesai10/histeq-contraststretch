function [J, alpha, beta, gamma, minInt, maxInt, meanval, stdval] = optimalEqualize(I)
  
  [counts, x] = imhist(I);
  [prob, cumprob] = probablities(counts, numel(I), 1);
  meanval = mean(I(:));
  stdval = std(I(:));
  percLeft = 3; percRight = 2;
  minInt = 0; maxInt = 255;
  
  rightLim = meanval + 1.5*stdval;
  leftLim = meanval - 1.5*stdval;
  
  r = uint8(rightLim);
  l = uint8(leftLim);
  
  while(cumprob(minInt + 1) <= percLeft/100)
    minInt++;
  endwhile
  
  while(cumprob(maxInt + 1) >= (100 - percRight)/100)
    maxInt--;
  endwhile
  [counts, ~] = imhist(I);
  I_stretched = stretch(I);
  I_eq = equalize2(I, counts);
  alpha =beta = gamma = 0;
  if(stdval <= 27.0)
    alpha = 0.1; beta = 0.2; gamma = 0.7;
  elseif(stdval>=50.0)
		if(maxInt - minInt <= 180)
			%if(abs(r-maxInt) < 5 && abs(l - minInt) < 5)
			%apply More of stretiching.
			alpha = 0.1; beta = 0.2; gamma = 0.7;
		elseif(maxInt - minInt <= 200)
			alpha = 0.1; beta = 0.6; gamma = 0.3;
		else
			alpha = 0.3; beta = 0.6; gamma = 0.1;
		endif
	else
		if(maxInt - minInt <= 120)
			%if(abs(r-maxInt) < 5 && abs(l - minInt) < 5)
			%apply More of stretiching.
			alpha = 0.1; beta = 0.2; gamma = 0.7;
		elseif(maxInt - minInt <= 150)
			alpha = 0.1; beta = 0.4; gamma = 0.5;
			
		elseif(maxInt - minInt <= 180)
			alpha = 0.1; beta = 0.6; gamma = 0.4;
		elseif(maxInt - minInt <= 200)
			alpha = 0.2; beta = 0.6; gamma = 0.2;
		else
			alpha = 0.3; beta = 0.6; gamma = 0.1;
		endif
	endif
	J = alpha*I + beta*I_eq + gamma*I_stretched;
	%J = 0;
endfunction