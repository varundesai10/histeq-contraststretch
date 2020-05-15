cd /home/varun/Desktop/ell_project/inputimages2
pkg load image
addpath('~/Desktop/ell_project/octave-scripts');
imagesjpg = glob('*.jpg');
imagespng = glob('*.png');
imagesjpeg = glob('*.jpeg');
images = cat(1, imagesjpeg, imagespng, imagesjpg);
cd ..
printf('%d images found.', size(images,1));
close;
for i = 1:size(images,1)
  I = imread(sprintf('inputimages2/%s',images{i}));
  printf('read image %d of %d.\n', i, size(images, 1));
  if(size(I,3) > 1)
    I = rgb2gray(I);
  endif
  [J, alpha, beta, gamma, minInt, maxInt, m, s] = optimalEqualize(I);
	mean_std_plot(I);
	[counts, x] = imhist(I);
	hold on;
	plot([minInt, minInt] , [0, 0.8*max(counts)], 'y');
	plot([maxInt, maxInt] , [0, 0.8*max(counts)], 'y');
	text(50, 0.85*max(counts), sprintf('a=%d b=%d c=%d',alpha, beta, gamma), 'fontsize', 10,'color', 'r');
	text(50, 0.9*max(counts), sprintf('M=%d m=%d R=%d',minInt, maxInt, maxInt-minInt), 'fontsize', 10,'color', 'r');
	title('original histogram');
	print(1, '-djpg',sprintf('experiments5/%d_1.jpg', i));
	close;
	%stem(x, counts, 'k');
	%title('final histogram');
	%print(1, '-djpg',sprintf('experiments5/%d_2.jpg', i));
	%close;
	%imwrite(I, sprintf('experiments5/%d_3.jpg', i));
	%imwrite(J, sprintf('experiments5/%d_4.jpg', i));
	%printf('DONE!\n');
endfor