function [beta0, beta1, xvar, bootstrp] = perpendicularfit(x, y, alpha)
% [beta0, beta1, xvar, bootstrp] = perpendicularfit(x, y, alpha)
%   
% calls fit_bothsubj2error and calculates the explained variance.
%
% input arguments
% x,y   - data the regression is fit to, i.e. vectors with equal length. 
% alpha - the ratio of variance, see fit_bothsubj2error for more
%           information
% 
% @CL


SSTy = sum( (y-mean(y)).^2 );

% fit that considers both x and y as subject to error
[beta0, beta1, bootstrp{1}, bootstrp{2}] = fit_bothsubj2error(x, y, alpha);

% predicted values by fit
yfit = x * beta1 + beta0;

% residual sum of squares
SSRy = sum( (y - yfit).^2 );
% explained variance
xvar = 1 - (SSRy / SSTy);
if xvar < 0; xvar = 0; end

end
