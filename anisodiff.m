%%%%%%%%%%%%% Function anisodiff %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
%   preform the anisotropic diffusion for image.
% Input: 
%  input: the input image; 
%  K: self defined K value; 
%  lambda=0,25;
%  form:  
%       1:g(.)=exponential
%       2:g(.)=inverse quatratic
% 
% Output:
%    diffusion: filtered image
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function diffusion= anisodiff(input, K, lambda,form)

 %it should add padding of 0 for calculating the N,S,E,W differences.
 input=double(input);
 img = padarray(input, [1, 1], 0);
 s=size(img);%Get size of image, N*N
 S=s(1,1);% get N
 
 %Compute the north, south, east and west difference
    north_diff = img(1:S-2, 2:S-1) - img(2:S-1, 2:S-1);
    south_diff = img(3:S, 2:S-1) - img(2:S-1, 2:S-1);
    east_diff = img(2:S-1, 3:S) - img(2:S-1, 2:S-1);
    west_diff = img(2:S-1, 1:S-2) - img(2:S-1, 2:S-1);
    
  % conduction coefficient for both forms
    %form 1 g(.)=exponential
    
    if form==1
    cN_1 = exp(-abs(north_diff/K).^2);
    cS_1 = exp(-abs(south_diff/K).^2);
    cE_1 = exp(-abs(east_diff/K).^2);
    cW_1 = exp(-abs(west_diff/K).^2);
    diffusion = input+lambda.*(cN_1.*north_diff+cS_1.*south_diff+cE_1.*east_diff+cW_1.*west_diff);
    
    elseif form==2
    %form 2  g(.)=inverse quatratic
    cN_2 = 1./(1 + (abs(north_diff)/K).^2);
    cS_2 = 1./(1 + (abs(south_diff)/K).^2);
    cE_2 = 1./(1 + (abs(east_diff)/K).^2);
    cW_2 = 1./(1 + (abs(west_diff)/K).^2);
    
    %Discrete (computer) implementation
    diffusion = input+lambda.*(cN_2.*north_diff+cS_2.*south_diff+cE_2.*east_diff+cW_2.*west_diff);
    
    end
    %get the finalanisotropic-diffusion results
