%plots mean, stddev on image
function mean_std_plot(I)
  pkg load image;
  %I = imread('lowcontrast.jpg');
  if(size(size(I)) > 1)
    I = rgb2gray(I);
  endif
  [counts, x] = imhist(I);
  meanval = mean(I(:));
  stdval = std(I(:));
  close;
  figure(1);
  hold on;
  plot(x, counts, 'k');
  axis([0,255]);
  xlabel('pixel instensities');
  ylabel('count of that pixel');
  plot([meanval, meanval], [0, max(counts)], 'r');
  plot([meanval + 0.5*stdval, meanval + 0.5*stdval], [0, max(counts)], 'b');
  plot([meanval - 0.5*stdval, meanval - 0.5*stdval], [0, max(counts)], 'b');
  plot([meanval + 1*stdval, meanval + 1*stdval], [0, max(counts)], 'g');
  plot([meanval - 1*stdval, meanval - 1*stdval], [0, max(counts)], 'g');
  plot([meanval + 1.5*stdval, meanval + 1.5*stdval], [0, max(counts)], 'm');
  plot([meanval - 1.5*stdval, meanval - 1.5*stdval], [0, max(counts)], 'm');
  text(10, 0.8*max(counts), sprintf('mean = %d, stddev = %d', meanval, stdval),'color', 'r', 'fontsize', 10);
  hold off;
endfunction