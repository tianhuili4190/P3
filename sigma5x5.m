%%%%%%%%%%%%% Function mean5x5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
% Compute a 5X5 mean (neighborhood average) filter at each pixel
% in an image
% Input: M:column number;N:Row number
% <ORIGINAL LINES 6-31 CUT FOR THIS DEMO>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [sigma_5] = sigma5x5(f,fzero,M,N)



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


for x = xlo : xhi % Don't consider boundary pixels that can't
    for y = ylo : yhi % be processed!
        num=0;
         
 
           for i = -2 : 2
            for j = -2 : 2
             if abs(g(x-i,y-j)-g(x,y))<=40
                sigma_5(x,y)= sigma_5(x,y)+g(x-i,y-j);
                num=num+1;
             end
            end
           end
    sigma_5(x,y) = sigma_5(x,y)/ num; % Normalize by the number of elements in the 5x5 filter (5*5 = 25)         
    end
end
% Convert back to an 8-bit image
sigma_5 = uint8(sigma_5);