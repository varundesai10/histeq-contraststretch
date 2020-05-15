for i = 1:22
  I = imread(sprintf('%d_1_image.jpg', i));
  J = imread(sprintf('%d_3_magehisteq.jpg', i));
  K = imread(sprintf('%d_5_imagestretched.jpg',i));
  subplot(1,3,1); imshow(I); title('original');
  subplot(1,3,2); imshow(J); title('equalized');
  subplot(1,3,3); imshow(K); title('stretched');
  print(1, '-djpg', sprintf('%d_7_all.jpg',i));
 endfor