%%%%%%%%%%%%% Function mean5x5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%   Compute a 5X5 mean filter at each pixel in an image.
% Input: 
%   M:column number;N:Row number; f: original image; fzero: zeros(M,N);
% Output:
%  mean_5: filted image.
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [mean_5] = mean5x5(f,fzero,M,N)
% Fill the output image with zeroes first
    for x = 1 : M
        for y = 1 : N
        mean_5(x,y) = fzero(x,y);
        end
    end
% Convert f to a 16-bit number, so we can do sums > 255 correctly
g = uint8(f);

% Define the coordinate limits for output pixels that can be properly
% computed by the 5X5 filter
xlo = 3; % Can't process first two columns
xhi = M-2; % Can't process last two columns
ylo = 3; % Can't process first two rows
yhi = N-2; % Can't process last two rows
% Compute the filtered output image

for x = xlo : xhi       % Don't consider boundary pixels that can't
    for y = ylo : yhi   % be processed!
        for i = -2 : 2
            for j = -2 : 2
            %sum of the pixels in 5x5 filter
            mean_5(x,y) = g(x-i,y-j) + mean_5(x,y); 
                                                      
            end
        end
    mean_5(x,y) = mean_5(x,y) / 25; % Normalize by the number of elements 
                                    %   in the 5x5 filter (5*5 = 25)
    end
end
% Convert back to an 8-bit image
mean_5 = uint8(mean_5);
