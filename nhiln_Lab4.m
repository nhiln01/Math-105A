% Nhi Nguyen
% 76164237
% Math 105A Lab 4

function [x] = gaussian(A)
% This function is written to implement Gaussian Elimination with partial pivoting
%   A = augmented matrix of a linear system
%   x = the solution of the linear system

% Step 1
n = size(A,1);

for i = 1:n
    NROW(i) = i;
end

% Steps 2 - 6
for i = 1:n-1
    [~,p] = max(abs(A(NROW(i:n),i)),[],1);
    p = p+i-1;
    
    if A(NROW(p),i) == 0
        disp ('no unique solution exists')
    return
    
    elseif p ~= i
        NCOPY = NROW(i);
        NROW(i) = NROW(p);
        NROW(p) = NCOPY;
    end
    
    for j = i+1:n
        m = A(NROW(j),i)/A(NROW(i),i);
        A(NROW(j),:) = A(NROW(j),:) - (m*A(NROW(i),:));
    end
end

% Step 7
if A(NROW(n),n) == 0
    disp('no unique solution exists')
    return
end

% Step 8
x = zeros(1,n);
x(n) = A(NROW(n),n+1)/A(NROW(n),n);

% Step 9-10
for i = n-1:-1:1
    x(i) = (A(NROW(i),n+1)-(sum(A(NROW(i),i+1:n).*x(i+1:n))))/(A(NROW(i),i));
end
end