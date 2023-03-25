%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project Name: CSE 585 digital image process Project 3 Part 2
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

%load the image
img = imread('cwheelnoise.gif');
%lambda value is given, k is self defined
lambda = 0.25;
K=20; 





%% Part 2(a)

%manually set the threshold=95, range = + 20,-20;
min_threshold = 95-20;
max_threshold = 95+20;
%create binary mask
mask = (img >= min_threshold) & (img <= max_threshold);
region = double(img) .* double(mask);

%Draw figures for  0 iteration
figure (1)
subplot(2,3,1);
imshow(img)
title('Anisotropic-diffusion results after 0 iteration (original figure)');
subplot(2,3,2)
imshow(img);
hold on;
line([1, size(img, 2)], [128, 128], 'Color', 'r', 'LineWidth', 2);
title('y=128');
subplot(2,3,3)
imshow(uint8(region))
title('Spokes from 0 iterations diffusion')
subplot(2,3,[4,5,6]);
[c_0,bin_0] = imhist(img);
bar(bin_0, c_0);
xlabel('Pixel intensity');
ylabel('Count');





% Compute anisotropic-diffusion results after first iteration
diffusion_1= anisodiff(img, K, lambda, 1);
diffusion_2= anisodiff(img, K, lambda, 2);




for i=1:99
   
 %Compute anisotropic-diffusion results inside loop from second iteration
 %to 99th iterations
 diffusion_1= anisodiff(diffusion_1, K, lambda,1);
 diffusion_2= anisodiff(diffusion_2, K, lambda,2); 


if i==4 

%Segementation computation for 5th iteration for form 1    
min_threshold = 95-20;
max_threshold = 95+20;
%create binary mask
mask = ( diffusion_1 >= min_threshold) & ( diffusion_1 <= max_threshold);
region = double( diffusion_1) .* double(mask);    
    
%transfer the image for plotting the result   
diffusion_1=uint8(diffusion_1);
diffusion_2=uint8(diffusion_2);

%Draw figures for  5 iterations result for form 1
figure (2)
subplot(2,3,1);
imshow(diffusion_1)
title('anisotropic-diffusion results after 5 iteration for form 1');
subplot(2,3,2)
imshow(diffusion_1);
hold on;
line([1, size(img, 2)], [128, 128], 'Color', 'r', 'LineWidth', 2);
title('y=128');
subplot(2,3,3)
imshow(uint8(region));
title('Spokes from 5 iterations for form1')
subplot(2,3,[4,5,6]);
[c_5,bin_5] = imhist(diffusion_1);
bar(bin_5, c_5);
xlabel('Pixel intensity');
ylabel('Count');

%Segementation computation for 5th iteration for form 2
min_threshold = 95-20;
max_threshold = 95+20;
%create binary mask
mask = ( diffusion_2 >= min_threshold) & ( diffusion_2 <= max_threshold);
region = double( diffusion_2) .* double(mask);  


%Draw figures for  5 iterations result for form 2
figure (3)
subplot(2,3,1);
imshow(diffusion_2)
title('anisotropic-diffusion results after 5 iteration for form 2');
subplot(2,3,2)
imshow(diffusion_2);
hold on;
line([1, size(img, 2)], [128, 128], 'Color', 'r', 'LineWidth', 2);
title('y=128');
subplot(2,3,3)
imshow(uint8(region));
title('Spokes from 5 iterations for form 2')
subplot(2,3,[4,5,6]);
[c_5,bin_5] = imhist(diffusion_2);
bar(bin_5, c_5);
xlabel('Pixel intensity');
ylabel('Count');

%transfer for the next iteration
diffusion_1=double(diffusion_1);
diffusion_2=double(diffusion_2);
end



if i==19
%Segementation computation for 20th iteration for form 1     
min_threshold = 95-20;
max_threshold = 95+20;
%create binary mask
mask = ( diffusion_1 >= min_threshold) & ( diffusion_1 <= max_threshold);
region = double( diffusion_1) .* double(mask);    
    
%transfer the image for plotting the result      
diffusion_1=uint8(diffusion_1);
diffusion_2=uint8(diffusion_2);

%Draw figures for  20 iterations result for form 1
figure (4)
subplot(2,3,1);
imshow(diffusion_1)
title('anisotropic-diffusion results after 20 iteration for form 1');
subplot(2,3,2)
imshow(diffusion_1);
hold on;
line([1, size(img, 2)], [128, 128], 'Color', 'r', 'LineWidth', 2);
title('y=128');
subplot(2,3,3)
imshow(uint8(region));
title('Spokes from 20 iterations for form 1');
subplot(2,3,[4,5,6]);
[c_5,bin_5] = imhist(diffusion_1);
bar(bin_5, c_5);
xlabel('Pixel intensity');
ylabel('Count');


%Segementation computation for 20th iteration for form 2
min_threshold = 95-20;
max_threshold = 95+20;
%create binary mask
mask = ( diffusion_2 >= min_threshold) & ( diffusion_2 <= max_threshold);
region = double( diffusion_2) .* double(mask);  

%Draw figures for  20 iterations result for form 2
figure (5)
subplot(2,3,1);
imshow(diffusion_2)
title('anisotropic-diffusion results after 20 iteration for form 2');
subplot(2,3,2)
imshow(diffusion_2);
hold on;
line([1, size(img, 2)], [128, 128], 'Color', 'r', 'LineWidth', 2);
title('y=128');
subplot(2,3,3)
imshow(uint8(region));
title('Spokes from 20 iterations for form 2');
subplot(2,3,[4,5,6]);
[c_5,bin_5] = imhist(diffusion_2);
bar(bin_5, c_5);
xlabel('Pixel intensity');
ylabel('Count');
%transfer for the next iteration
diffusion_1=double(diffusion_1);
diffusion_2=double(diffusion_2);
end

if i==99  

%Segementation computation for 100th iteration for form 1 
min_threshold = 95-20;
max_threshold = 95+20;
%create binary mask
mask = ( diffusion_1 >= min_threshold) & ( diffusion_1 <= max_threshold);
region = double( diffusion_1) .* double(mask); 

%transfer the image for plotting the result  
diffusion_1=uint8(diffusion_1);
diffusion_2=uint8(diffusion_2);     

%Draw figures for 100 iterations result for form 1    
figure (6)
subplot(2,3,1);
imshow(diffusion_1)
title('anisotropic-diffusion results after 100 iteration for form 1');
subplot(2,3,2)
imshow(diffusion_1);
hold on;
line([1, size(img, 2)], [128, 128], 'Color', 'r', 'LineWidth', 2);
title('y=128');
subplot(2,3,3)
imshow(uint8(region));
title('Spokes from 100 iterations for form 1');
subplot(2,3,[4,5,6]);
subplot(2,3,[4,5,6]);
[c_6,bin_6] = imhist(diffusion_1);
bar(bin_6, c_6);
xlabel('Pixel intensity');
ylabel('Count');

%Segementation computation for 100th iteration for form 2 
min_threshold = 95-20;
max_threshold = 95+20;
%create binary mask
mask = ( diffusion_2 >= min_threshold) & ( diffusion_2 <= max_threshold);
region = double( diffusion_2) .* double(mask);  


%Draw figures for  100 iterations result for form 2
figure (7)
subplot(2,3,1);
imshow(diffusion_2)
title('anisotropic-diffusion results after 100 iteration for form 2');
subplot(2,3,2)
imshow(diffusion_2);
hold on;
line([1, size(img, 2)], [128, 128], 'Color', 'r', 'LineWidth', 2);
title('y=128');
subplot(2,3,3)
imshow(uint8(region));
title('Spokes from 100 iterations for form 2');
subplot(2,3,[4,5,6]);
[c_7,bin_7] = imhist(diffusion_2);
bar(bin_7, c_7);
xlabel('Pixel intensity');
ylabel('Count');

%transfer for the next iteration
diffusion_1=double(diffusion_1);
diffusion_2=double(diffusion_2);
end

end





%% Part 2 (b)
%load the image
Cam = imread('cameraman.tif');

%show the figure for anisotropic-diffusion results after 0 iteration(original figure)
figure (8)
imshow(Cam)
title('cameraman after 0 iteration (original figure)');
Cam=double(Cam);

%Applying the anisotropic-diffusion on image for form 1 and form 2 for the
%first iteration
cam_1= anisodiff(Cam, K, lambda, 1);
cam_2= anisodiff(Cam, K, lambda, 2);

for i=1:99
   
 %Applying the anisotropic-diffusion on image for form 1 and form 2 from
 %second iteration to the 100th iteration
 cam_1= anisodiff(cam_1, K, lambda,1);
 cam_2= anisodiff(cam_2, K, lambda,2); 
 
if i==4 
%Thansfer the image for the following process    
cam_1=uint8(cam_1);
cam_2=uint8(cam_2);

%%Draw figures for  5 iterations result for form 1 and form 2
figure (9)
subplot(1,2,1);
imshow(cam_1)
title('Cameraman results after 5 iteration for form 1');
subplot(1,2,2);
imshow(cam_2)
title('Cameraman results after 5 iteration for form 2');
end

if i==19 
%Thansfer the image for the following process 
cam_1=uint8(cam_1);
cam_2=uint8(cam_2);
%%Draw figures for  20 iterations result for form 1 and form 2
figure (10)
subplot(1,2,1);
imshow(cam_1)
title('Cameraman results after 20 iteration for form 1');
subplot(1,2,2);
imshow(cam_2)
title('Cameraman results after 20 iteration for form 2');
end

if i==99 
 %Thansfer the image for the following process    
cam_1=uint8(cam_1);
cam_2=uint8(cam_2);
%%Draw figures for  100 iterations result for form 1 and form 2
figure (11)
subplot(1,2,1);
imshow(cam_1)
title('Cameraman results after 100 iteration for form 1');
subplot(1,2,2);
imshow(cam_2)
title('Cameraman results after 100 iteration for form 2');
end


end




