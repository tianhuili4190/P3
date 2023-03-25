%%%%%%%%%%%%% Function median5x5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%   Compute a 5X5 median filter at each pixel in an image.
% Input: 
%   f: original image
% Output:
%  sigma_5: filted image.
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [median_5] = median5x5(f)
median_5= medfilt2(f,[5 5]);%performs median filtering, where each output 
                            %pixel contains the median value in the 5 by 5 
                            %neighborhood around the corresponding pixel 
                            %in the input image.

% Convert back to an 8-bit image                           
median_5 = uint8(median_5);
