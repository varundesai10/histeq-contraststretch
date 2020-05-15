
function [A,B] = flip_phase_mag(i,j) %must be of same dimensions!
  pkg load image
  F = fft2(i);
  K = fft2(j);
  j = sqrt(-1);
  F_mag = abs(F); F_ph = arg(F);
  K_mag = abs(K); K_ph = arg(K);
 
  

  A =  uint8(real(ifft2(((K_mag).*(exp(j.*(F_ph)))))));
  B =  uint8(real(ifft2(((F_mag).*(exp(j.*(K_ph)))))));
  
endfunction
