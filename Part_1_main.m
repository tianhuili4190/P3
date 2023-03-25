clc
clear all

f = imread('disk.gif');
fzero = zeros(256, 256);

%% 1 iteration
mean_1 = mean5x5(f,fzero,256,256);
median_1 = median5x5(f);
alpha_trimmed_1 = alpha_trimmed5x5(f,fzero,256,256);
sigma_1 = sigma5x5(f,fzero,256,256);
symmetric_1 = symmetric5x5(f,fzero,256,256);


%% 5 iterations
mean_5 = mean_1;
median_5 = median_1;
alpha_trimmed_5 = alpha_trimmed_1;
sigma_5 = sigma_1;
symmetric_5 = symmetric_1;



for x=1:4
mean_5 = mean5x5(mean_5,fzero,256,256);  
median_5 = median5x5( median_5);
alpha_trimmed_5 = alpha_trimmed5x5(alpha_trimmed_5,fzero,256,256);
sigma_5 = sigma5x5(sigma_5,fzero,256,256);
symmetric_5 = symmetric5x5(symmetric_5,fzero,256,256);
end

[c_1,bin_1] = imhist(mean_5);
[c_2,bin_2] = imhist(median_5);
[c_3,bin_3] = imhist(alpha_trimmed_5 );
[c_4,bin_4] = imhist(sigma_5);
[c_5,bin_5] = imhist(symmetric_5);

figure (1)
subplot(2,2,1);
imshow(mean_1)
title('mean 5x5 1 iteration');
subplot(2,2,2);
imshow(mean_5)
title('mean 5x5 5 iterations');
subplot(2,2,[3,4]);
bar(bin_1, c_1);
xlabel('Pixel intensity');
ylabel('Count');


figure (2)
subplot(2,2,1);
imshow(median_1)
title('median 5x5 1 iteration');
subplot(2,2,2);
imshow(median_5)
title('median 5x5 5 iterations');
subplot(2,2,[3,4]);
bar(bin_2, c_2);
xlabel('Pixel intensity');
ylabel('Count');

figure (3)
subplot(2,2,1);
imshow(alpha_trimmed_1)
title('alpha_trimmed mean 5x5 1 iteration');
subplot(2,2,2);
imshow(alpha_trimmed_5)
title('alpha_trimmed mean 5x5 5 iterations');
subplot(2,2,[3,4]);
bar(bin_3, c_3);
xlabel('Pixel intensity');
ylabel('Count');


figure (4)
subplot(2,2,1);
imshow(sigma_1)
title('sigma 5x5 1 iteration');
subplot(2,2,2);
imshow(sigma_5)
title('Sigma 5x5 5 iterations');
subplot(2,2,[3,4]);
bar(bin_4, c_4);
xlabel('Pixel intensity');
ylabel('Count');

figure (5)
subplot(2,2,1);
imshow(symmetric_1)
title('symmetric 5x5 1 iteration');
subplot(2,2,2);
imshow(symmetric_5)
title('symmetric 5x5 5 iterations');
subplot(2,2,[3,4]);
bar(bin_5, c_5);
xlabel('Pixel intensity');
ylabel('Count');

submean = imread('submean.png');
submedian = imread('submedian.png');
subalpha = imread('subalpha.png');
subsigma = imread('subsigma.png');
subsymmetric = imread('subsymmetric.png');



std_mean = std2(submean);
mean_mean = mean2(submean);
std_median = std2(submedian);
mean_median = mean2(submedian);
std_alpha_trimmed = std2(subalpha);
mean_alpha_trimmed = mean2(subalpha);
std_sigma = std2(subsigma);
mean_sigma = mean2(subsigma);
std_symmetric = std2(subsymmetric);
mean_symmetric = mean2(subsymmetric);
