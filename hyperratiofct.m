function y = hyperratiofct( x, r_max, c50, n, m)
%hyperbolic ratio function
%CL

y = r_max .* ( x.^n ./ (x.^n + c50^n) ) + m;

end

