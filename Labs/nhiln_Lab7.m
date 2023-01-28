% Nhi Nguyen
% 76164237
% Math 105A Lab 7

function [x] = SOR(A,b,w,x0,N,tol,tol_r)
% This function is written to implement the SOR iteration to solve the linear system
%   A,b = the linear system A*x=b to be solved
%   x0 = initial guess
%   tol = tolerance
%   tol_r = tolerance for the residual
%   N = maximum number of iterations

% Step 1
k = 1;
n = size(A,1);

% Step 2 - 3
while k <= N    
    for i = 1:n
        sum_x = 0;
        sum_x0 = 0;
        
        for j = 1:i-1
            sum_x = sum_x + A(i,j)*x(j);
        end
        
        for j = i+1:n
            sum_x0 = sum_x0 + A(i,j)*x0(j);
        end
        
        x(i,1) = (1-w)*x0(i)+ w*(((-sum_x-sum_x0)+b(i))/A(i,i));
    end
    
% Step 4
    if norm(A*x-b)<tol_r
        fprintf('||Ax-b|| is smaller than %0.2e',tol_r)
        return
    end
    
% Step 5    
    if norm(x-x0)<tol
        fprintf('||x_{n+1}-x_{n}|| is smaller than %0.2e',tol)
        return
    end
    
% Step 6
for i = 1:n
    x0=x;
end

k=k+1;
end

% Step 7
   fprintf('Maximum number of iterations exceeded')
end