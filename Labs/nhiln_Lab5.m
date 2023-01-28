% Nhi Nguyen
% 76164237
% Math 105A Lab 5

function [L,U,P] = PLU_factorization(A)
% This function is written to implement PLU factorization with partial pivoting
%   A = a matrix of a linear system
%   L = lower triangular matrix
%   U = upper triangular matrix
%   P = permutation matrix

% Step 1
n = size(A,1);

for i = 1:n
    NROW(i) = i;
end
M = zeros(n,n);

% Step 2-3
for i = 1:n-1
    [~,p] = max(abs(A(NROW(i:n),i)),[],1);
    p = p+i-1;
    
% Step 4-6    
    if A(NROW(p),i) ~= 0
        
        if p ~= i
            NCOPY = NROW(i);
            NROW(i) = NROW(p);
            NROW(p) = NCOPY;
        end
        
        for j = i+1:1:n
            M(NROW(j),i) = A(NROW(j),i)/A(NROW(i),i);
            A(NROW(j),:) = A(NROW(j),:) - M(NROW(j),i)*A(NROW(i),:);
        end
    end
    
end

% Step 7
P = eye(n);

% Step 8-9
L = M(NROW(:),:)+P;
U = A(NROW(:),:);
P = P(NROW(:),:);

end