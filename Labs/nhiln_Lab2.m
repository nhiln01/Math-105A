% Nhi Nguyen
% 76164237
% Math 105A Lab 2

function [p] = newton(f,df,p0,N,tol,tol_fp)

% This function was made to implement Newton's method
%    f = the function to be solved
%    df = the derivative of f
%    p0 = initial guess
%    tol = tolerance for |p-p0|
%    tol_fp = tolerance for |f(p)|
%    N = maximum number of iterations

n = 1;
q = f(p0);

while n <= N
    p = p0 - q/(df(p0));
    q = f(p);
    
    if abs(q) < tol_fp
        fprintf('|f(p)| is smaller than %0.2e',tol_fp)
        return
    elseif abs(p-p0) < tol
        fprintf('p is converged with |p_{n+1}-p_{n}| smaller than %0.2e',tol)
        return
    end
    
n = n+1;
p0 = p;

end

disp('Maximum number of iteration is reached')

end