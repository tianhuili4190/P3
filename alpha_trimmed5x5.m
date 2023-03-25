function [alpha_trimmed_5] = alpha_trimmed5x5(f,fzero,M,N)
alpha=0.25;
threshold=double(int8(alpha*25));


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


for x = xlo : xhi % Don't consider boundary pixels that can't
    for y = ylo : yhi % be processed!
        num=0;
         for i = -2 : 2
            for j = -2 : 2
             q(3-i,3-j)=g(x-i,y-j);  %window matrix q is 5X5
            end
         end
         
         for z=(threshold+1):(25-threshold)
             B = ordfilt2(q,z,ones(5,5));
             alpha_trimmed_5(x,y)=alpha_trimmed_5(x,y)+B(3,3);
         end
         
    alpha_trimmed_5(x,y) = alpha_trimmed_5(x,y)/ 13; % Normalize by the number of elements in the 5x5 filter         
    end
end
% Convert back to an 8-bit image
alpha_trimmed_5 = uint8(alpha_trimmed_5);