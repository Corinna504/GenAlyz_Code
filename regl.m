function  regl
% draws a type-II regression line in the current plot for all data plotted
% with scatter(). 
% if there are any red scatters, the function only considers them assuming
% that they are serotonin related data.
% if the current axes contains UserData, it derives the relevant
% information from that structure, assuming it is a dat structure attached
% in mugui().
% 
%@CL


% 
if isempty(get(gca, 'UserData'))
    obj = gca;
    
    sc = findobj(obj, 'type', 'scatter');
    col = vertcat(sc.MarkerFaceColor);
    
    % if any data point is red, then only consider those
    if any(col(:,1) ==1 & col(:,2) == 0 & col(:,3) == 0)
        xdat = horzcat(sc(isred).XData);
        ydat = horzcat(sc(isred).YData);
    else
        xdat = horzcat(sc.XData);
        ydat = horzcat(sc.YData);
    end
else
    % if there is user data, assume it is a plot of the serotonin project,
    % use the user data to derive the serotonin related data and compute
    % the regression for them only
    dat = get(gca', 'UserData');
    xdat = dat.x(dat.is5HT);
    ydat = dat.y(dat.is5HT);
end



% fit and plot according to axis scale
if strcmp(get(gca, 'XScale'), 'log') && strcmp(get(gca, 'YScale'), 'log')
        
    [beta0, beta1] = fit_bothsubj2error(log(xdat), log(ydat), var(log(ydat))/var(log(xdat))); ho;
    plot(get(gca, 'xlim'), exp(log(get(gca, 'xlim')).*beta1 +beta0), 'k--', 'LineWidth', 0.5);
    
elseif ~strcmp(get(gca, 'XScale'), 'log') && strcmp(get(gca, 'YScale'), 'log')
    
    [beta0, beta1] = fit_bothsubj2error(xdat, log(ydat), var(log(ydat))/var(xdat)); ho;
    plot(get(gca, 'xlim'), exp(get(gca, 'xlim').*beta1 +beta0), 'k--', 'LineWidth', 0.5);

elseif strcmp(get(gca, 'XScale'), 'log') && ~strcmp(get(gca, 'YScale'), 'log')
    hold on
    
    [beta0, beta1] = fit_bothsubj2error(log(xdat), ydat, var(ydat)/var(log(xdat))); ho;
    plot(get(gca, 'xlim'), log(get(gca, 'xlim')).*beta1 +beta0, 'k--', 'LineWidth', 0.5);
   
else
    nani=isnan(xdat)|isnan(ydat); 
    [beta0, beta1] = fit_bothsubj2error(xdat(~nani), ydat(~nani), var(ydat(~nani))/var(xdat(~nani))); ho; 
    plot(get(gca, 'xlim'), get(gca, 'xlim').*beta1 +beta0, 'k--', 'LineWidth', 0.5)
end


end

