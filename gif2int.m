function [trans] = gif2int(X)

trans = X;
[M,N] = size(trans);
for i = 1 : M
    for j = 1 : N
        if trans(i,j) == 1
            trans(i,j) = 0;
        elseif trans(i,j) == 0
            trans(i,j) = 255;
        end
    end
end
end
