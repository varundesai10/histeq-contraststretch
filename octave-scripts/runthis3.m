cd /home/varun/Desktop/ell_project/inputimages2
pkg load image
addpath('~/Desktop/ell_project/octave-scripts');
imagesjpg = glob('*.jpg');
imagespng = glob('*.png');
imagesjpeg = glob('*.jpeg');
images = cat(1, imagesjpeg, imagespng, imagesjpg);
cd ..
printf('%d images found.', size(images,1));
for i = 1:size(images,1)
  I = imread(sprintf('inputimages2/%s',images{i}));
  printf('read image %d of %d.\n', i, size(images, 1));
  if(size(I,3) > 1)
    I = rgb2gray(I);
  endif
  [counts,x] = imhist(I);
  printf('equalizing image...\n');
  J = equalize2(I,counts);
  printf('equalized.\n stretching image.\n');
  K = stretch(I);
  F = stretch_simple(I);
  printf('image stretched.\n Plotting figure.\n');
  [counts2, x2] = imhist(J);
  [counts3,x3] = imhist(K);
  [counts4,x4] = imhist(F);
  
  imwrite(I, sprintf('experiments2/%d_original.jpg', i));
  imwrite(J, sprintf('experiments2/%d_equalized.jpg', i));
  imwrite(K, sprintf('experiments2/%d_stretched.jpg', i));
  imwrite(F, sprintf('experiments2/%d_stretched_simple.jpg', i));
   
  figure(1);
  stem(x, counts, 'marker', 'none'); title('original histogram');
  figure(2);
  stem(x2, counts2, 'marker', 'none'); title('eq histogram');
  figure(3);
  stem(x3, counts3, 'marker', 'none'); title('stretched histogram');
  figure(4);
  stem(x4, counts4, 'marker', 'none'); title('stretched simple histogram');
  
  %subplot(3,3,1); imshow(I); title('original');
  %subplot(3,3,4); imhist(I); title(sprintf('original histogram'));
  
  %subplot(3,3,2); imshow(J); title('histogram equalization');
  %subplot(3,3,5); imhist(J); title('equalized histogram');
  
  %subplot(3,3,3); imshow(K); title('contrast stretching');
  %subplot(3,3,6); imhist(K); title('stretched histogram');
  
  print(1,'-djpg', sprintf('experiments2/%d_1', i));
  print(2,'-djpg', sprintf('experiments2/%d_2', i));
  print(3,'-djpg', sprintf('experiments2/%d_3', i));
  print(4,'-djpg', sprintf('experiments2/%d_4', i));
  close all;
  printf('done. \n');
endfor