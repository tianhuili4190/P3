img = imread('cwheelnoise.gif');

lambda = 0.25;
K=25;% Increase K, the difference among images will be more clear.





%% Part 2(a)
figure (1)
subplot(2,2,1);
imshow(img)
title('Anisotropic-diffusion results after 0 iteration (original figure)');
subplot(2,2,2)
imshow(img);
hold on;
line([1, size(img, 2)], [128, 128], 'Color', 'r', 'LineWidth', 2);
title('y=128');
subplot(2,2,[3,4]);
[c_0,bin_0] = imhist(img);
bar(bin_0, c_0);
xlabel('Pixel intensity');
ylabel('Count');

img=double(img);

diffusion_1= anisodiff(img, K, lambda, 1);
diffusion_2= anisodiff(img, K, lambda, 2);




for i=1:99
   
 
 diffusion_1= anisodiff(diffusion_1, K, lambda,1);
 diffusion_2= anisodiff(diffusion_2, K, lambda,2); 


if i==5 
diffusion_1=uint8(diffusion_1);
diffusion_2=uint8(diffusion_2);
figure (2)
subplot(2,2,1);
imshow(diffusion_1)
title('anisotropic-diffusion results after 5 iteration for form 1');
subplot(2,2,2)
imshow(diffusion_1);
hold on;
line([1, size(img, 2)], [128, 128], 'Color', 'r', 'LineWidth', 2);
title('y=128');
subplot(2,2,[3,4]);
[c_5,bin_5] = imhist(diffusion_1);
bar(bin_5, c_5);
xlabel('Pixel intensity');
ylabel('Count');


figure (3)
subplot(2,2,1);
imshow(diffusion_2)
title('anisotropic-diffusion results after 5 iteration for form 2');
subplot(2,2,2)
imshow(diffusion_2);
hold on;
line([1, size(img, 2)], [128, 128], 'Color', 'r', 'LineWidth', 2);
title('y=128');
subplot(2,2,[3,4]);
[c_5,bin_5] = imhist(diffusion_2);
bar(bin_5, c_5);
xlabel('Pixel intensity');
ylabel('Count');
diffusion_1=double(diffusion_1);
diffusion_2=double(diffusion_2);
end



if i==20
diffusion_1=uint8(diffusion_1);
diffusion_2=uint8(diffusion_2);

figure (4)
subplot(2,2,1);
imshow(diffusion_1)
title('anisotropic-diffusion results after 20 iteration for form 1');
subplot(2,2,2)
imshow(diffusion_1);
hold on;
line([1, size(img, 2)], [128, 128], 'Color', 'r', 'LineWidth', 2);
title('y=128');
subplot(2,2,[3,4]);
[c_5,bin_5] = imhist(diffusion_1);
bar(bin_5, c_5);
xlabel('Pixel intensity');
ylabel('Count');


figure (5)
subplot(2,2,1);
imshow(diffusion_2)
title('anisotropic-diffusion results after 20 iteration for form 2');
subplot(2,2,2)
imshow(diffusion_2);
hold on;
line([1, size(img, 2)], [128, 128], 'Color', 'r', 'LineWidth', 2);
title('y=128');
subplot(2,2,[3,4]);
[c_5,bin_5] = imhist(diffusion_2);
bar(bin_5, c_5);
xlabel('Pixel intensity');
ylabel('Count');
diffusion_1=double(diffusion_1);
diffusion_2=double(diffusion_2);
end

if i==99  
diffusion_1=uint8(diffusion_1);
diffusion_2=uint8(diffusion_2);     
    
figure (6)
subplot(2,2,1);
imshow(diffusion_1)
title('anisotropic-diffusion results after 100 iteration for form 1');
subplot(2,2,2)
imshow(diffusion_1);
hold on;
line([1, size(img, 2)], [128, 128], 'Color', 'r', 'LineWidth', 2);
title('y=128');
subplot(2,2,[3,4]);
[c_5,bin_5] = imhist(diffusion_1);
bar(bin_5, c_5);
xlabel('Pixel intensity');
ylabel('Count');


figure (7)
subplot(2,2,1);
imshow(diffusion_2)
title('anisotropic-diffusion results after 100 iteration for form 2');
subplot(2,2,2)
imshow(diffusion_2);
hold on;
line([1, size(img, 2)], [128, 128], 'Color', 'r', 'LineWidth', 2);
title('y=128');
subplot(2,2,[3,4]);
[c_5,bin_5] = imhist(diffusion_2);
bar(bin_5, c_5);
xlabel('Pixel intensity');
ylabel('Count');
diffusion_1=double(diffusion_1);
diffusion_2=double(diffusion_2);
end

end

%% Part 2 (b)

Cam = imread('cameraman.tif');

figure (8)
imshow(Cam)
title('cameraman after 0 iteration (original figure)');
Cam=double(Cam);

cam_1= anisodiff(Cam, K, lambda, 1);
cam_2= anisodiff(Cam, K, lambda, 2);

for i=1:99
   
 
 cam_1= anisodiff(cam_1, K, lambda,1);
 cam_2= anisodiff(cam_2, K, lambda,2); 
 
if i==5 
cam_1=uint8(cam_1);
cam_2=uint8(cam_2);

figure (9)
subplot(1,2,1);
imshow(cam_1)
title('Cameraman results after 5 iteration for form 1');
subplot(1,2,2);
imshow(cam_2)
title('Cameraman results after 5 iteration for form 2');
end

if i==20 
cam_1=uint8(cam_1);
cam_2=uint8(cam_2);
figure (10)
subplot(1,2,1);
imshow(cam_1)
title('Cameraman results after 20 iteration for form 1');
subplot(1,2,2);
imshow(cam_2)
title('Cameraman results after 20 iteration for form 2');
end

if i==99 
cam_1=uint8(cam_1);
cam_2=uint8(cam_2);

figure (11)
subplot(1,2,1);
imshow(cam_1)
title('Cameraman results after 100 iteration for form 1');
subplot(1,2,2);
imshow(cam_2)
title('Cameraman results after 100 iteration for form 2');
end


end