function [symmetric_5] = symmetric5x5(f,fzero,M,N)
% Fill the output image with zeroes first
    for x = 1 : M
        for y = 1 : N
        symmetric_5(x,y) = fzero(x,y);
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
        for i = -2 : 2
            for j = -2 : 2
             q(3-i,3-j)=g(x-i,y-j);  %window matrix q is 5X5
            end
        end
        w=q(3,3);
        for X=1:3
            for Y=1:3
             if abs(q(3,3)-q(X,Y))>=abs(q(3,3)-q(6-X,6-Y))
                q(X,Y)=0;
             end  
             if abs(q(3,3)-q(X,Y))<abs(q(3,3)-q(6-X,6-Y))
                q(6-X,6-Y)=0;   
             end
            end
            
        end
        
        
    symmetric_5(x,y) = (sum(q,"all")+w )/ 13; % Normalize by the number of elements in the 5x5 filter (5*5 = 25)
    end
end
% Convert back to an 8-bit image
symmetric_5= uint8(symmetric_5);