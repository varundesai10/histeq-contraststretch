%plots mean, stddev on image
pkg load image;
I = imread('lowcontrast.jpg');
I = rgb2gray(I);
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
text(150, 0.8*max(counts), sprintf('mean = %d, stddev = %d', meanval, stdval), 'fontsize', 16);
hold off;