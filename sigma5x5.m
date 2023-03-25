%%%%%%%%%%%%% Function Sigma5x5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%   Compute a 5X5 Sigma filter at each pixel in an image.
% Input: 
%   M:column number;N:Row number; f: original image; fzero: zeros(M,N);
% Output:
%  sigma_5: filted image.
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [sigma_5] = sigma5x5(f,fzero,M,N)
sigma=20; %Given by the question

% Fill the output image with zeroes first
    for x = 1 : M
        for y = 1 : N
        sigma_5(x,y) = fzero(x,y);
        end
    end
    
% Convert f to a 16-bit number, so we can do sums > 255 correctly
g = uint16(f);

% Define the coordinate limits for output pixels that can be properly
% computed by the 5X5 filter
xlo = 3; % Can't process first two columns
xhi = M-2; % Can't process last two columns
ylo = 3; % Can't process first two rows
yhi = N-2; % Can't process last two rows
% Compute the filtered output image


for x = xlo : xhi       % Don't consider boundary pixels that can't
    for y = ylo : yhi   %    be processed!
        num=0;
         
% Only if a difference value between the a pixel in side 5x5 filter and middle 
%   pixel(Xk) is smaller than 2*simga, this value of pixel will be consider
%   for computing the final mean value.

  
           for i = -2 : 2
            for j = -2 : 2
             if abs(g(x-i,y-j)-g(x,y))<=(sigma*2)
                sigma_5(x,y)= sigma_5(x,y)+g(x-i,y-j);
                num=num+1; %count the number of pixels 
                           %    for final mean computation.
             end
            end
           end
           
    sigma_5(x,y) = sigma_5(x,y)/ num; % compute the mean value for 5x5 filter.   
    end
end
% Convert back to an 8-bit image
sigma_5 = uint8(sigma_5);
