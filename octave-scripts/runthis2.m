cd /home/varun/Desktop/ell_project/inputimages
pkg load image
imagesjpg = glob('*.jpg');
imagespng = glob('*.png');
imagesjpeg = glob('*.jpeg');
images = cat(1, imagesjpeg, imagespng, imagesjpg);
cd ..

for i = 1:size(images,1)
  I = imread(sprintf('inputimages/%s',images{i}));
  if(size(I,3) > 1)
    I = rgb2gray(I);
  endif
  [counts,x] = imhist(I);
  J = equalize2(I,counts);
  alpha = 0.1;
  while(alpha <= 1.0)
    K = uint8(floor((1-alpha)*I + alpha*J));
    figure;
    subplot(1,2,1); imshow(I); title('original');
    subplot(1,2,2); imshow(K); title(sprintf('adjusted with alpha = %d', alpha));
    print('-djpg', sprintf('alpha_experiments/%d_%d', i, uint8(floor(alpha*10))));
    close;
    alpha += 0.1;
  endwhile
endfor