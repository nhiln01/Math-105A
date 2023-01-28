% Nhi Nguyen
% 76164237
% Math 105A Lab 6

function [x] = richardson(A,b,w,x0,N,tol,tol_r)
% This function is written to implement the Richardson iteration to solve the linear system
%   A,b = the linear system A*x = b to be solved
%   x0 = initial guess
%   tol = tolerance
%   tol_r = tolerance for the residual
%   N = maximum number of iterations

% Step 1
n = 1;
T = eye(size(A,1))-w*A;
rho = max(abs(eig(T)));

% Step 2
if abs(rho) >= 1
    disp('The iteration diverge')
    return
end

% Step 3 - 4
while n <= N
    v = A*x0-b;
    
% Step 5   
    if norm(v) < tol_r
        disp('||Ax-b|| is smaller than %0.2e',tol_r)
        return
    end
    
% Step 6    
    x = x0-w*v;
    
% Step 7    
    if norm(x-x0) < tol
        x0 = x;
        fprintf('||x_{n+1}-x_{n}|| is smaller than %0.2e',tol)
        return
    end
   
% Step 8 - 9    
    x0 = x;
    n = n+1;
    
end
end