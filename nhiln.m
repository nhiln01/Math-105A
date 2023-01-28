% Nhi Nguyen
% 76164237
% Math 105A Lab 1

function [c] = bisection(f,a,b,N,tol,tol_fc)

% The purpose of this function is to implement the bisection method

n = 1;
Fa = f(a);

while n <= N;
    c = (a+b)/2;
    Fc = f(c);
    
    if abs(Fc) < tol_fc;
        disp ('|f(c)| is smaller than the tolerance')
        return
        
    elseif (b-a)/2 < tol;
        fprintf ('c is converged with %0.2e accuracy\n',tol)
        return
    end
    
n = n+1;

if Fa*Fc < 0;
    b = c;
else
    a = c;
    Fa = Fc;
end

end

disp('Maximum number of iteration is reached')   

end