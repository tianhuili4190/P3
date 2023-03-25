%%%%%%%%%%%%% Function alpha_trimmed5x5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%   Compute a 5X5 alpha-trimmed mean filter at each pixel in an image.
% Input: 
%   M:column number;N:Row number; f: original image; fzero: zeros(M,N);
% Output:
%  alpha_trimmed_5: filted image.
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [alpha_trimmed_5] = alpha_trimmed5x5(f,fzero,M,N)
alpha=0.25;% Given by the question
threshold=double(int8(alpha*25)); %N=25, int8(alpha*25)gives a integer threshold(6),
                                  % double(int8(alpha*25)) transfer number to
                                  % "double" for the following computation.


% Fill the output image with zeroes first
    for x = 1 : M
        for y = 1 : N
        alpha_trimmed_5(x,y) = fzero(x,y);
        w(x,y)=fzero(x,y);
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
    for y = ylo : yhi   %   be processed!
       
         for i = -2 : 2
            for j = -2 : 2
             q(3-i,3-j)=g(x-i,y-j);  %window matrix q is 5X5
            end
         end
% The filter exclue the first 6 and the last 6 pixels of the sorted pixel
%   values, which means the pixels need to be considered start from 7th to
%   19th pixels in the 5x5 filter.

         for z=(threshold+1):(25-threshold) 
             B = ordfilt2(q,z,ones(5,5));
             %B outpus a 5x5 matrix, so using B(3,3) to sum up the total
             %  number.
             alpha_trimmed_5(x,y)=alpha_trimmed_5(x,y)+B(3,3);
         end
    %Computation for the mean value of 13 value in the range regulated by
    %   threshold
    alpha_trimmed_5(x,y) = alpha_trimmed_5(x,y)/ 13; 
                                                               
    end
end
% Convert back to an 8-bit image
alpha_trimmed_5 = uint8(alpha_trimmed_5);
