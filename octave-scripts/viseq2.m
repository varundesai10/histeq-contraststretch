function J = viseq2(I,n)
  [COUNTS,x] = imhist(I);
  [prob_inti, cumprob_init] = probablities(COUNTS, size(I,1), size(I,2));
  J = equalize2(I, COUNTS);
  
  [COUNTS_FINAL, x_FINAL] = imhist(J);
  [prob_final, cumprob_final] = probablities(COUNTS_FINAL, size(J,1), size(J,2));
  
  figure;
  subplot(2,3,1); imshow(I); title('original image');
  subplot(2,3,2); stem(x, prob_inti); title('original probabilty');
  subplot(2,3,3); stem(x, cumprob_init); title('original cumulative probability');
  
  subplot(2,3,4); imshow(J); title('equalized image');
  subplot(2,3,5); stem(x_FINAL, prob_final); title('final probability');
  subplot(2,3,6); stem(x_FINAL, cumprob_final); title('final cumulative probability');
  print('-djpg',sprintf('converted/%d.jpg',n));
  
endfunction