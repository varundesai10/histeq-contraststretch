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
  J = viseq2(I,i);
  close
  %imsave(J, sprintf('%d_converted',i));
endfor