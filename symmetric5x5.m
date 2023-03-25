%%%%%%%%%%%%% Function symmetric5x5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%   Compute a 5X5 symmetric nearest-neighbor mean filter at each pixel
%   in an image
% Input:
%   M:column number; N:Row number; f:orgianl image
% Output:
%   symmetric_5: filtered image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [symmetric_5] = symmetric5x5(f,fzero,M,N)
% Fill the output image with zeroes first
    for x = 1 : M
        for y = 1 : N
        symmetric_5(x,y) = fzero(x,y);
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
    for y = ylo : yhi   %   be processed!
        for i = -2 : 2
            for j = -2 : 2
             q(3-i,3-j)=g(x-i,y-j);  %Window matrix q is 5X5
            end
        end
        w=q(3,3); % The value of the pixel in the middle(Xk)
        q=double(q);
        %In a pair of pixels symmetric according to the Xk, delete the one
        %    has value that far from the middle pixel.
        
       %compare pairs (X,Y) and (6-X,6-Y)
       %(X,Y)from (1,1) to (1,4),from (2,1) to (2,3),
       % (3,1), (3,2), (4,4)
       %set a count called hh to compare the paired pixels(not include the pixels on diagonal)
       hh=4;
        for X=1:4
            for Y=1:hh
               
             if abs(q(3,3)-q(X,Y))>=abs(q(3,3)-q(6-X,6-Y))
                q(X,Y)=0;
             elseif (q(3,3)-q(X,Y))<abs(q(3,3)-q(6-X,6-Y))
                q(6-X,6-Y)=0;   
             end
            end
           hh=hh-1;
           if hh==0
               break
           end
        end
        
        % Then compare the numbers on the diagonal
        if abs(q(3,3)-q(5,1))>=abs(q(3,3)-q(1,5))
           q(5,1)=0; 
        elseif abs(q(3,3)-q(5,1))<abs(q(3,3)-q(1,5))
           q(1,5)=0;   
        end
        
        if abs(q(3,3)-q(4,2))>=abs(q(3,3)-q(2,4))
           q(4,2)=0; 
        elseif abs(q(3,3)-q(4,2))<abs(q(3,3)-q(2,4))
           q(2,4)=0;   
        end
        
    %Compute the final mean with the middle pixel value.     
    symmetric_5(x,y) = sum(q,"all") / 13; 
    end
end
% Convert back to an 8-bit image
symmetric_5= uint8(symmetric_5);
