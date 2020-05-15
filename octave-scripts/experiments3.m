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
  printf('plotting mean_std...\n');
  mean_std_plot(I);
  print(1,'-djpg', sprintf('experiments3/%d_2_hist', i));
  imwrite(I, sprintf('experiments3/%d_1_image.jpg',i));
  close;
  printf('done.\n');
  printf('equalizing histogram....\n');
  [counts, ~] = imhist(I);
  J = equalize2(I,counts);
  [counts, x] = imhist(J);
  stem(x, counts, 'k');
  axis([0,255]);
  xlabel('pixel instensities');
  ylabel('count of that pixel');
  title('equalized histogram');
  print(1,'-djpg', sprintf('experiments3/%d_4_histeq', i));
  imwrite(J, sprintf('experiments3/%d_3_magehisteq.jpg', i));
  close;
  printf('done.\n');
  printf('stretching histogram....\n');
  
  K = stretch_simple(I);
  [counts, x] = imhist(K);
  stem(x, counts, 'k');
  axis([0,255]);
  xlabel('pixel instensities');
  ylabel('count of that pixel');
  title('stretched histogram');
  print(1,'-djpg', sprintf('experiments3/%d_6_stretched', i));
  imwrite(K, sprintf('experiments3/%d_5_imagestretched.jpg', i));
  close;
  printf('done.\n');
endfor