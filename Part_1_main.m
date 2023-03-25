%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project Name: CSE 585 digital image process Project 3 Part 1
%
% Purpose:
%   (1)Applying 5 different filters on the image, "disk.gif" for 1 and 5
%   iterations.
%   (2)Gives the gray-scale histogram for 5th iteration
%   (3)Calculate the mean and standard deviation of the interior 
%        of the large disk region 
%
% Author: Junzhe Huang, Yiyang Mei, Tianhui Li
% Date: 03/25/2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all


%Load the image
f = imread('disk.gif');

%set the fzero
fzero = zeros(256, 256);

%% 1 iteration
%Computation of the image after these filters by 1 iteration.
mean_1 = mean5x5(f,fzero,256,256);
median_1 = median5x5(f);
alpha_trimmed_1 = alpha_trimmed5x5(f,fzero,256,256);
sigma_1 = sigma5x5(f,fzero,256,256);
symmetric_1 = symmetric5x5(f,fzero,256,256);


%% 5 iterations
%Computation of the image after these filters by 5 iterations.

%Computation for the first iteration
mean_5 = mean_1;
median_5 = median_1;
alpha_trimmed_5 = alpha_trimmed_1;
sigma_5 = sigma_1;
symmetric_5 = symmetric_1;


%Computation for the second iteration to fifth iterations
for x=1:4
mean_5 = mean5x5(mean_5,fzero,256,256);  
median_5 = median5x5( median_5);
alpha_trimmed_5 = alpha_trimmed5x5(alpha_trimmed_5,fzero,256,256);
sigma_5 = sigma5x5(sigma_5,fzero,256,256);

symmetric_5 = symmetric5x5(symmetric_5,fzero,256,256);
end
%calculates the histogram for the grayscale image. 
%The imhist function returns the histogram counts 
%   in counts and the bin locations in binLocations.

[c_1,bin_1] = imhist(mean_5);
[c_2,bin_2] = imhist(median_5);
[c_3,bin_3] = imhist(alpha_trimmed_5 );
[c_4,bin_4] = imhist(sigma_5);
[c_5,bin_5] = imhist(symmetric_5);

%compute the figure for image after mean filter for 1 iteration,
%   5 iterations, and its histogram figure
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

%compute the figure for image after median filter for 1 iteration,
%   5 iterations, and its histogram figure
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


%compute the figure for image after alpha-trimmed mean filter for 1 iteration,
%   5 iterations, and its histogram figure
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

%compute the figure for image after sigma mean filter for 1 iteration,
%   5 iterations, and its histogram figure
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


%compute the figure for image after symmetric nearest-neighbor mean filter 
% for 1 iteration, 5 iterations, and its histogram figure
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

%Load the images got from screenshot screenshot of large disk region
submean = imread('submean.png');
submedian = imread('submedian.png');
subalpha = imread('subalpha.png');
subsigma = imread('subsigma.png');
subsymmetric = imread('subsymmetric.png');

%compute the mean and standard deviation of the interior of the large disk region
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






